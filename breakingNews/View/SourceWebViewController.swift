//
//  SourceWebViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 1.09.2022.
//

import UIKit
import WebKit

class SourceWebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var url: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        let urlString = url
        let url = URL(string: urlString!)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
}
