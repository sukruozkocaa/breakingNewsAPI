//
//  NewsDetailViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 1.09.2022.
//

import UIKit
import SDWebImage
import WebKit

class NewsDetailViewController: UIViewController {

 
    @IBOutlet var pictureView: UIImageView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var descriptionView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    var imageURL:String?
    var details:String?
    var author:String?
    var siteUrl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = details
        authorLabel.text = author
        pictureView.sd_setImage(with: URL(string: imageURL ?? ""), placeholderImage: UIImage(named: "dummy") )
        pictureView.layer.cornerRadius = 10
        pictureView.layer.borderWidth = 2
        pictureView.layer.borderColor = UIColor.black.cgColor
        descriptionView.layer.cornerRadius = 6
        descriptionView.layer.shadowColor = UIColor.systemPink.cgColor
        descriptionView.layer.shadowOpacity = 1
        descriptionView.layer.shadowOffset = .zero
        descriptionView.layer.shadowRadius = 5
    }
    @IBAction func sourceNews(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewControl = storyboard.instantiateViewController(withIdentifier: "webPage") as! SourceWebViewController
        nextViewControl.url = self.siteUrl
        navigationController?.pushViewController(nextViewControl, animated: true)
    }
    
}
