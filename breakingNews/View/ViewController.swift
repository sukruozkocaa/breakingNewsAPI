//
//  ViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet var collectionViewImage: UICollectionView!
    @IBOutlet var collectionViewData: UICollectionView!
    
    @IBOutlet var pageControls: UIPageControl!
    
    //MARK: - Variables
    
   // var timer : Timer?
    var currentTimer = 0
    var result : [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionViewData.reloadData()
                self.collectionViewImage.reloadData()
            }
        }
    }
    var result2 : [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionViewImage.reloadData()
                self.collectionViewData.reloadData()
            }
        }
    }
    //MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUp2()
        startTimer()
        navBarEdit(nav: navigationController!)
        nibCell(col: collectionViewImage)
        
        pageControls.numberOfPages = 20
        let nibCell = UINib(nibName: "DataCollectionViewCell", bundle: nil)
        collectionViewData.register(nibCell, forCellWithReuseIdentifier: "celldata")
        collectionViewImage.layer.cornerRadius = 5
            
        
        
        title = "Anasayfa"
      
        
    }
    //MARK: - CollectionView Func
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionViewImage) {
            return result2.count
            
        }
        else{
            return result.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionViewImage) {
            let cell = collectionViewImage.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
            let articleVM = result2[indexPath.row]
            cell.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""), placeholderImage: UIImage(named: "bi_haber"))
            return cell
        }
        else {
            
            let cell2 = collectionViewData.dequeueReusableCell(withReuseIdentifier: "celldata", for: indexPath) as! DataCollectionViewCell
            let articleVM = result[indexPath.row]
            cell2.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
            cell2.authorLabel.text = articleVM.description
            cell2.sourceLabel.text = articleVM.source.name
            return cell2
            }
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == collectionViewImage) {
            let articleVM = result2[indexPath.row]
            articleSegue(nav: navigationController!, indexPth: indexPath, item: articleVM)
        }
        else {
            let articleVM2 = result[indexPath.row]
            articleSegue(nav: navigationController!, indexPth: indexPath, item: articleVM2)
        }
    }
   
    

    
   
    
    
    
    
    
    
    //MARK: - Functions
    func setUp() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&apiKey=8fd05e9753934846a12d6611c2e61afb")!
        Webservice().getData(url: url) { articles in
            if let articles = articles {
                self.result = articles
            }
           
        }
    }
    func setUp2() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=8fd05e9753934846a12d6611c2e61afb")!
        Webservice().getData(url: url) { articles in
            if let articles2 = articles {
                self.result2 = articles2
            }
        }
    }
    
    var timer: Timer?
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self ,  selector: #selector(citytoIndex), userInfo: nil, repeats: true)
    }
    @objc func citytoIndex(){
        if currentTimer < result2.count - 1 {
            currentTimer += 1
        }
        else{
            currentTimer = 0
        }
        collectionViewImage!.scrollToItem(at: IndexPath(item: currentTimer, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        pageControls.currentPage = currentTimer
    }
    
}






