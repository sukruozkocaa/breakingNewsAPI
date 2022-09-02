//
//  ArticleSegueModel.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 2.09.2022.
//

import Foundation

extension ArticleSegueModel{
    var nextViewControl (index:IndexPath) {
        let articleVM = articleListVM.articleAtIndex(index.row)!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewControl = storyboard.instantiateViewController(withIdentifier: "details") as! NewsDetailViewController
        nextViewControl.imageURL = articleVM.urlToImage
        nextViewControl.details = articleVM.description
        nextViewControl.author = articleVM.author
        nextViewControl.siteUrl = articleVM.url
        self.navigationController?.pushViewController(nextViewControl, animated: true)
    }
}
