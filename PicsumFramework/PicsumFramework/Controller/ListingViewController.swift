//
//  ListingViewController.swift
//  PicsumFramework
//
//  Created by Admin on 27/08/22.
//

import UIKit

public class ListingViewController: UIViewController {

    @IBOutlet weak var listingCollectionView: UICollectionView!
    var viewModel = PicsumViewModel()

    public init() {
         super.init(nibName: "ListingViewController", bundle: Bundle(for: ListingViewController.self))
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    public  override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        fetchGalleryData()
    }
    
    func registerNib() {
        self.listingCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle(for: CollectionViewCell.self)), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func fetchGalleryData() {
        viewModel.delegate = self
        viewModel.getHomeData()
    }
}

extension ListingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.picusmData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as! CollectionViewCell
        cell.data = viewModel.picusmData[indexPath.item]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = self.listingCollectionView.cellForItem(at: indexPath)  as? CollectionViewCell
        self.listingCollectionView.bringSubviewToFront(selectedCell!)

        if selectedCell?.transform == CGAffineTransform(scaleX: 1.2, y: 2) {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
                selectedCell?.transform = .identity
            })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
                selectedCell?.transform = CGAffineTransform(scaleX: 1.2, y: 2)
                })
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell = self.listingCollectionView.cellForItem(at: indexPath)  as? CollectionViewCell
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            unselectedCell?.transform = .identity
        })
    }
}
extension ListingViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.height)
        
    }
}

extension ListingViewController: ReloadGalleryDataDelegate {
    func reloadGalleryData() {
        self.listingCollectionView.reloadData()
    }
}
