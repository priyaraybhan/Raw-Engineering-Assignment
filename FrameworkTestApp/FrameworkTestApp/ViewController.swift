//
//  ViewController.swift
//  FrameworkTestApp
//
//  Created by Admin on 27/08/22.
//

import UIKit
import PicsumFramework

class ViewController: UIViewController {

    @IBOutlet weak var galleryContainer: UIView!
    var listView : ListingViewController = ListingViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.view.frame = self.galleryContainer.bounds
        self.galleryContainer.addSubview(listView.view)
        
        // Do any additional setup after loading the view.
    }


}

