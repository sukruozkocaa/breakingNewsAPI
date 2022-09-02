//
//  Article.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation

struct ArticleList : Decodable{
    let articles : [Article]!
}

struct Article:Decodable {
    var author : String?
    var title : String?
    var description : String?
    var urlToImage : String?
    var url : String?
}
