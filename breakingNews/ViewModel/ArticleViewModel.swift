//
//  ArticleViewModel.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit
import SDWebImage




func articleSegue(nav: UINavigationController, indexPth : IndexPath, item: Article){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewControl = storyboard.instantiateViewController(withIdentifier: "details") as! NewsDetailViewController
    nextViewControl.imageURL = item.urlToImage
    nextViewControl.details = item.description
    nextViewControl.author = item.author
    nextViewControl.siteUrl = item.url
    nav.pushViewController(nextViewControl, animated: true)
    
}

func navBarEdit(nav :UINavigationController) {
    nav.navigationBar.topItem?.title = "Bi Haber"
    nav.navigationBar.layer.cornerRadius = 5
}

func nibCell(col : UICollectionView) {
    let nibCell = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    col.register(nibCell, forCellWithReuseIdentifier: "cell")
}






 
