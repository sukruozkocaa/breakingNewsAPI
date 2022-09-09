//
//  DataCollectionViewCell.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 8.09.2022.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var myView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 3
        myView.layer.cornerRadius = 3
        // Initialization code
    }

}
