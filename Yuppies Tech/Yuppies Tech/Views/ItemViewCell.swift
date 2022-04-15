//
//  ItemViewCell.swift
//  Yuppies Tech
//
//  Created by Vishwanath Vallamkondi on 15/04/22.
//

import UIKit
import SDWebImage

class ItemViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView?
    
    override func prepareForReuse() {
        imageView?.image = nil
    }
    
    func loadRandomImage(url: URL?) {
        imageView?.sd_setImage(with: url, placeholderImage: nil)
    }
}
