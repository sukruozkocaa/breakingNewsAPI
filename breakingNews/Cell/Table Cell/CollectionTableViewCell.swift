//
//  CollectionTableViewCell.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 12.09.2022.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    
    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
