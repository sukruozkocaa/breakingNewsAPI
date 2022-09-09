//
//  SecondViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 7.09.2022.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celldata", for: indexPath) as! DataCollectionViewCell
        let articleVM = result[indexPath.row]
        cell.authorLabel.text = articleVM.title
        cell.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width)/2
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleVM = result[indexPath.row]
        articleSegue(nav: navigationController!, indexPth: indexPath, item: articleVM)
    }
    
    
    
    
    var result : [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    //@IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Manşet"
        setUp()
        let nibCell = UINib(nibName: "DataCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "celldata")
    }
    
    func setUp() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=8fd05e9753934846a12d6611c2e61afb")!
        Webservice().getData(url: url) { articles in
            if let articles = articles {
                self.result = articles
            }
           
        }
    }
}
/*
extension SecondViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celldata", for: indexPath) as! DataCollectionViewCell
        let articleVM = result[indexPath.row]
        cell.authorLabel.text = articleVM.author
        cell.imageView.sd_setImage(with: URL(string: articleVM.urlToImage!), placeholderImage: UIImage(named: "dummy"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)
        return CGSize(width: size, height: size)
    }
    
  
    
}
*/
