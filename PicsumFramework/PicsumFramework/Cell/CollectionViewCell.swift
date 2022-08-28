//
//  CollectionViewCell.swift
//  PicsumFramework
//
//  Created by Admin on 27/08/22.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var authorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var data: PicsumModel? {
        didSet {
            setAuthorImage(imagePath: data?.downloadUrl ?? "")
        }
    }
    func setAuthorImage(imagePath: String) {
        do {
            try self.authorImage.downloadImage(urlString: imagePath, placeHolder: UIImage(named: "picsum.png",
                                                                                    in: Bundle(for: type(of:self)),
                                                                                    compatibleWith: nil))
        } catch {
            print(error.localizedDescription)
        }
    }

}
