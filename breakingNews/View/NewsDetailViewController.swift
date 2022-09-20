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

 
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pictureView: UIImageView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var sourceView1: UIView!
    @IBOutlet var sourceView2: UIView!
    @IBOutlet var sourceView3: UIView!
    
    @IBOutlet var imageView2: UIImageView!
    
    var imageURL:String?
    var details:String?
    var author:String?
    var siteUrl : String?
    var publishedAt : String?
    var titles : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = details
        authorLabel.text = "\(author!)"
        pictureView.sd_setImage(with: URL(string: imageURL ?? ""), placeholderImage: UIImage(named: "dummy") )
        pictureView.layer.cornerRadius = 10
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.preferredMaxLayoutWidth =  700
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.sizeToFit()
        titleLabel.text = titles
        let date = publishedAt
        var strArray = Array(date!)
        strArray[10] = " "
        strArray[19] = " "
         let date2 = String(strArray)
        dateLabel.text = date2
        sourceView1.layer.cornerRadius = sourceView1.bounds.height
        
        imageView2.layer.cornerRadius = imageView2.bounds.size.width / 2
        
        sourceView2.layer.cornerRadius = imageView2.bounds.size.width / 2
        
        sourceView3.layer.cornerRadius = sourceView2.bounds.size.width
        
        imageView2.clipsToBounds = true
        imageView2.image = UIImage(named: "eyee")
       
        
      
        
    }
    @IBAction func sourceNews(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewControl = storyboard.instantiateViewController(withIdentifier: "webPage") as! SourceWebViewController
        nextViewControl.url = self.siteUrl
        navigationController?.pushViewController(nextViewControl, animated: true)
    }
    
}
