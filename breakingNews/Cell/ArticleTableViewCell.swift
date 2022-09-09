//
//  ArticleTableViewCell.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit

class ArticleTableViewCell:UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var pictureView: UIImageView!
    
    func items(item: Article) {
        self.pictureView.sd_setImage(with: URL(string: item.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
        self.titleLabel.text = item.title
        pictureView.layer.borderWidth = 2
        pictureView.layer.borderColor = UIColor.white.cgColor
        pictureView.layer.cornerRadius = 10
    }
}
