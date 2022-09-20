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
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 3
        myView.layer.cornerRadius = 3
      //  imageView.layer.shadowRadius = 10
        
        
        //imageView.layer.cornerRadius =  imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        let gradient = CAGradientLayer()
        gradient.frame = imageView.bounds
        let startColor = UIColor(red: 30/255, green: 50/255, blue: 79/255, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        gradient.colors = [startColor, endColor]
        imageView.layer.insertSublayer(gradient, at: 1)
        
        // Initialization code
    }

}
