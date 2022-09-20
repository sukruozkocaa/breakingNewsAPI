//
//  SecondViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 7.09.2022.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    @IBOutlet var collectionView: UICollectionView!
    
    var result : [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Manşet"
        setUp()
        let nibCell = UINib(nibName: "DataCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "celldata")
    }
    
    func setUp() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=8c0553f31978470aae603abb9254a13a")!
        Webservice().getData(url: url) { articles in
            if let articles = articles {
                self.result = articles
            }
           
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celldata", for: indexPath) as! DataCollectionViewCell
        let articleVM = result[indexPath.row]
        cell.authorLabel.text = articleVM.title
        cell.sourceLabel.text = articleVM.source.name
        cell.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
        let aString = articleVM.publishedAt
        let newString = aString!.replacingOccurrences(of: "T" , with: " ", options: .literal, range: nil)
        let newString2 = newString.replacingOccurrences(of: "Z" , with: " ", options: .literal, range: nil)
        cell.dateLabel.text = String(newString2)
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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        SecondCollectionHeader(kind: kind, col: collectionView, indexpth: indexPath)
    }
}

