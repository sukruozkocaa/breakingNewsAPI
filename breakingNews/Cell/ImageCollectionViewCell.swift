//
//  ImageCollectionViewCell.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 8.09.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 5
        // Initialization code
    }

}
