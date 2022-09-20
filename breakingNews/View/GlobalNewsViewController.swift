//
//  GlobalNewsViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 13.09.2022.
//

import UIKit
import SDWebImage

class GlobalNewsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    var result : [Article] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()

            }
        }
    }

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dünya"
        let nibCell = UINib(nibName: "DataCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "celldata")
        setUp()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celldata", for: indexPath) as! DataCollectionViewCell
        let articleVM = result[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""), placeholderImage : UIImage(named: "bi_haber"))
        cell.authorLabel.text = articleVM.title
        cell.sourceLabel.text = articleVM.source.name
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
        GlobalCollectionHeader(kind: kind, col: collectionView, indexpth: indexPath)
    }
    
    func setUp() {
        let url = URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8c0553f31978470aae603abb9254a13a")!
        Webservice().getData(url:url)  { articles in
            if let articles = articles {
                self.result = articles
            }
        }
    }
    

   

}
