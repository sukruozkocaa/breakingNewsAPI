//
//  ViewController.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UITableViewDelegate, UITableViewDataSource {
    private var articleListVM :ArticleListViewModel!
    
    //MARK: - Elements
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var pageControlVw: UIPageControl!
    
    
    //MARK: - Variables
    
    var timer : Timer?
    var currentTimer = 0
    var imageUrl:String?
    var descriptionTitle :String?
    var authorText:String?
    var siteURL : String?
    //MARK: - Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlVw.currentPage = 0
        setUp()
        naviBarEdit()
        collectionView.layer.cornerRadius = 5
    }
    //MARK: - CollectionView Func
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionCount(section: section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellcall", for: indexPath) as! NewsSliderCollectionViewCell
        let articleVM = articleListVM.articleAtIndex(indexPath.row)
        cell.pictureView.sd_setImage(with: URL(string: articleVM?.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
        cell.pictureView.layer.cornerRadius = 5
        pageControlVw.numberOfPages = articleListVM.articles!.count
        pageControlVw.currentPage = indexPath.row - 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let deg1 = articleListVM.articleSegue(indexPth: indexPath)
        navigationController?.pushViewController(deg1, animated: true)
    }
    
    //MARK: - TableView Func
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionCount(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        let articleVM = articleListVM.articleAtIndex(indexPath.row)
        cell.pictureView.sd_setImage(with: URL(string: articleVM?.urlToImage ?? ""), placeholderImage: UIImage(named: "dummy"))
        cell.titleLabel.text = articleVM?.title
        cell.pictureView.layer.borderWidth = 2
        cell.pictureView.layer.borderColor = UIColor.white.cgColor
        cell.pictureView.layer.cornerRadius = 10
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deg1 = articleListVM.articleSegue(indexPth: indexPath)
        navigationController?.pushViewController(deg1, animated: true)
    }
    
    //MARK: - Timer
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(citytoIndex), userInfo: nil, repeats: true)
    }
    @objc func citytoIndex(){
        if currentTimer == (articleListVM.articles!.count)-1 {
            currentTimer = -1
        }
        else{
            currentTimer += 1
            collectionView.scrollToItem(at: IndexPath(item: currentTimer, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        }
    }
    //MARK: - Functions
    
    func setUp() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=tr&apiKey=8fd05e9753934846a12d6611c2e61afb")!
        Webservice().getData(url: url) { articles in
            if let articles = articles {
              self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.selfLoad(count: articles.count)
                    self.startTimer()
                }
            }
        }
    }
    func selfLoad(count:Int?){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.tableView.reloadData()
    }
    func sectionCount(section:Int) -> Int{
        return self.articleListVM.numberOfRowsInSection(section)
    }
    func naviBarEdit(){
        navigationController?.navigationBar.topItem?.title = "Bi Haber"
        navigationController?.navigationBar.layer.cornerRadius = 5

    }
}







