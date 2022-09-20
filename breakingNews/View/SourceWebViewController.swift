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
      
        let url = URL(string: url ?? "")
        let request = URLRequest(url: (url!))
        do {
            try webView.load(request)
        }
        catch {
            print("hata")
        }
    
    }
    
}
