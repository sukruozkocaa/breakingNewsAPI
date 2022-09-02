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
    @IBOutlet var descriptionLabel: UILabel!
    var imageURL:String?
    var details:String?
    var author:String?
    var siteUrl : String?
   /* let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript=true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }() */
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = details
        authorLabel.text = author
        pictureView.sd_setImage(with: URL(string: imageURL ?? ""), placeholderImage: UIImage(named: "nummy") )
        pictureView.layer.cornerRadius = 10
        pictureView.layer.borderWidth = 2
        pictureView.layer.borderColor = UIColor.black.cgColor
       
        
                
        
    }
   
    @IBAction func sourceNews(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewControl = storyboard.instantiateViewController(withIdentifier: "webPage") as! SourceWebViewController
        nextViewControl.url = self.siteUrl
        navigationController?.pushViewController(nextViewControl, animated: true)
    }
    
}
