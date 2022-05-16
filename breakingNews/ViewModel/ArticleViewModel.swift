//
//  ArticleViewModel.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation


struct ArticleListViewModel {
    let articles: [Article]
    
}

extension ArticleListViewModel {
    var numerOfSections:Int {
        return articles.count
    }
    
    func numberOfRowsInSection(_ seciton: Int) -> Int {
        return articles.count
    }
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
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
    var authot: String?{
        return self.article.author
    }
    var description: String? {
        return self.article.description
    }
   
}
