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
    nextViewControl.author = item.source.name
    nextViewControl.siteUrl = item.url
    nextViewControl.publishedAt = item.publishedAt
    nextViewControl.titles = item.title
    nav.pushViewController(nextViewControl, animated: true)
    
}
func navBarEdit(nav :UINavigationController) {
  
    nav.navigationBar.topItem?.leftBarButtonItem?.tintColor = UIColor.red
    nav.navigationBar.barStyle = UIBarStyle.default
    nav.navigationBar.tintColor = UIColor.black
}

/*
func nibCell(col : UICollectionView) {
    let nibCell = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    col.register(nibCell, forCellWithReuseIdentifier: "cell")
}*/

func nibDataCell(col : UICollectionView) {
    let nibCell = UINib(nibName: "DataCollectionViewCell", bundle: nil)
    col.register(nibCell, forCellWithReuseIdentifier: "celldata")
}


func nibImageCells(col : UICollectionView) {
    let nibCell = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    col.register(nibCell, forCellWithReuseIdentifier: "cell")
}




func MainCollectionHeader(kind : String,col : UICollectionView, indexpth: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
        if let headerView = col.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexpth) as? HeaderCollectionReusableView {
            
            
            return headerView
        }
    default:
        return UICollectionReusableView()
    }
    return UICollectionReusableView()
}
func SecondCollectionHeader(kind : String,col : UICollectionView, indexpth: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
        if let headerView = col.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexpth) as? HeaderCollectionReusableView {
            headerView.turkImage.image = UIImage(named: "turkbayragi")
            headerView.turkLabel.text = "Türkiye Gündemi"            
            return headerView
        }
    default:
        return UICollectionReusableView()
    }
    return UICollectionReusableView()
}

func GlobalCollectionHeader(kind : String,col : UICollectionView, indexpth: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
        if let headerView = col.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexpth) as? HeaderCollectionReusableView {
            headerView.worldImage.image = UIImage(named: "world")
            headerView.worldLabel.text = "Dünya'da Neler Oluyor ?"
            return headerView
        }
    default:
        return UICollectionReusableView()
    }
    return UICollectionReusableView()
}





 
