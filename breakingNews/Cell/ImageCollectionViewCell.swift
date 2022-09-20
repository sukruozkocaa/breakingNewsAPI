//
//  ImageCollectionViewCell.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 8.09.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var imageView: UIImageView!
    static let identifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
       
        imageView.layer.cornerRadius = 5
        // Initialization code
    }

}
