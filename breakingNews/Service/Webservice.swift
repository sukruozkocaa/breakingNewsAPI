//
//  Webservice.swift
//  breakingNews
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit

class Webservice {
    func getData(url: URL,completion:@escaping ([Article]?) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription) //Local olarak otomatik açıklama gösterir
                completion(nil)
            }
            else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                } 
            }
        }.resume()
        
    }
}
