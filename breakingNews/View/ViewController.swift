//
//  ViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import UIKit
import SDWebImage


final class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
   
    @IBOutlet var collectionViewData: UICollectionView!
    @IBOutlet var collectionViewImage: UICollectionView!
    
    
    //MARK: - Variables
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
                self.collectionViewData.reloadData()
                self.collectionViewImage.reloadData()
            }
        }
    }
    //MARK: - Load
   
    private let imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        imageView.image = UIImage(named: "bi_haber")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Anasayfa"
        setUp()
        setUp2()
        startTimer()
        navBarEdit(nav: navigationController!)
        nibDataCell(col: collectionViewData)
        nibImageCells(col: collectionViewImage)
        
        let rect2 = CGRect(x: 0, y: 350, width: self.view.bounds.width, height: 530)
        self.collectionViewData.frame = rect2
        
        let rect0 = CGRect(x: 0, y: 80, width: self.view.bounds.width, height: 245)
        self.collectionViewImage.frame = rect0
      
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.setFrame()
            self.setFrame2()
        }
      

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
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
        if collectionView == collectionViewData {
            let cell2 = collectionViewData.dequeueReusableCell(withReuseIdentifier: "celldata", for: indexPath) as! DataCollectionViewCell
            let articleVM = result[indexPath.row]
            cell2.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
            cell2.authorLabel.text = articleVM.description
            cell2.sourceLabel.text = articleVM.source.name
            let aString = articleVM.publishedAt
            let newString = aString!.replacingOccurrences(of: "T" , with: " ", options: .literal, range: nil)
            let newString2 = newString.replacingOccurrences(of: "Z" , with: " ", options: .literal, range: nil)
            cell2.dateLabel.text = String(newString2)
            return cell2
        }
        else {
            let cell = collectionViewImage.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
            let articleVM = result2[indexPath.row]
            cell.imageView.sd_setImage(with: URL(string: articleVM.urlToImage ?? ""),placeholderImage: UIImage(named: "dummy"))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleVM2 = result[indexPath.row]
        let articleVM = result2[indexPath.row]
        if collectionView == collectionViewData {
            articleSegue(nav: navigationController!, indexPth: indexPath, item: articleVM2)
        }
        else {
            articleSegue(nav: navigationController!, indexPth: indexPath, item: articleVM)
        }
       
    }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        MainCollectionHeader(kind: kind, col: collectionView, indexpth: indexPath)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let a = (scrollView.contentOffset.y)
        
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            if -10 ... 50 ~= a  {
                print(a)
                setFrame2()
            }
        }
        else {
            if 2 ... 100 ~= a{
                print(a)
                setFrame()
            }
        }
    }
    //MARK: -Scroll Frame
    
    func setFrame() {
        UIView.animate(withDuration: 1.0, delay: 0) {
            let rect0 = CGRect(x: 0, y: 80, width: self.view.bounds.width, height: 0)
            self.collectionViewImage.frame = rect0
            
            let rect2 = CGRect(x: 0, y: 80, width: self.view.bounds.width, height: 740)
            self.collectionViewData.frame = rect2
        }
    }
    func setFrame2() {
        UIView.animate(withDuration: 1.0, delay: 0) {
            let rect2 = CGRect(x: 0, y: 350, width: self.view.bounds.width, height: 530)
            self.collectionViewData.frame = rect2
            
            let rect0 = CGRect(x: 0, y: 80, width: self.view.bounds.width, height: 245)
            self.collectionViewImage.frame = rect0
        
        }
    }
    
    
    
    //MARK: - Data Call
    
    func setUp() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&apiKey=8c0553f31978470aae603abb9254a13a")!
        Webservice().getData(url: url) { articles in
            if let articles = articles {
                self.result = articles
            }
        }
       
    }
    func setUp2() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=8c0553f31978470aae603abb9254a13a")!
        Webservice().getData(url: url) { articles in
            if let articles2 = articles {
                self.result2 = articles2
            }
        }
    }
    
    //MARK: - Timer Image
    
    var timer: Timer?
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self ,  selector: #selector(citytoIndex), userInfo: nil, repeats: true)
    }
    @objc func citytoIndex(){
        if currentTimer < result2.count - 1 {
            currentTimer += 1
        }
        else{
            currentTimer = 0
        }
        collectionViewImage!.scrollToItem(at: IndexPath(item: currentTimer, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
}





