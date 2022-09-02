//
//  ArticleViewModel.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit


struct ArticleListViewModel {
    var articles: [Article]?
}

extension ArticleListViewModel {
    var numerOfSections:Int {
        return articles?.count ?? 0
    }
    
    func numberOfRowsInSection(_ seciton: Int) -> Int {
        return  articles?.count ?? 0
    }
    func articleAtIndex(_ index: Int) -> ArticleViewModel? {
        guard let article = self.articles?[index] else { return nil }
        return ArticleViewModel(article)
    }
    func articleSegue(indexPth : IndexPath) -> UIViewController{
        let articleVM = articleAtIndex(indexPth.row)!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewControl = storyboard.instantiateViewController(withIdentifier: "details") as! NewsDetailViewController
        nextViewControl.imageURL = articleVM.urlToImage
        nextViewControl.details = articleVM.description
        nextViewControl.author = articleVM.author
        nextViewControl.siteUrl = articleVM.url
        return nextViewControl
    }
}


//MARK: - 1.KISIM

struct ArticleViewModel {
    private let article: Article
}

//Eklenti oluşturma - Extension
extension ArticleViewModel {
    init(_ article: Article){
        self.article = article
    }
    
}

extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    var author: String?{
        return self.article.author
    }
    var description: String? {
        return self.article.description
    }
    var urlToImage: String? {
        return self.article.urlToImage
    }
    var url : String? {
        return self.article.url
    }
   
}
