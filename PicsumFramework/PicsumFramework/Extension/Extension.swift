//
//  Extension.swift
//  Picsum
//
//  Created by Admin on 26/08/22.
//

import Foundation
import UIKit
import SDWebImage

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}

extension UIImageView{

func downloadImage(urlString : String, placeHolder : UIImage?) throws{
    if let url = URL(string: urlString){
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        self.sd_setImage(with: url, placeholderImage: placeHolder)
        self.sd_imageIndicator?.stopAnimatingIndicator()
        }

    }
}

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable public var rounded: Bool {
        get {
            return true
        }
        set {
            if newValue {
                self.roundView()
            }
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable public var isTopRounded: Bool {
        get {
            return true
        }
        set {
            if newValue {
                DispatchQueue.main.async {
                    self.roundCorners([.topLeft, .topRight], radius: 3)
                }
            }
        }
    }
    
    func roundView() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
