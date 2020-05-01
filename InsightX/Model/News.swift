//
//  News.swift
//  InsightX
//
//  Created by Arish Tripathi on 21/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct articles: Codable, Identifiable, Hashable{
    
    let id = UUID()
    var author: String,
    title: String,
    description: String,
    url: String,
    urlToImage: String,
    publishedAt: String,
    content: String,
    show: Bool
    
}

let NewsData = newsApi()

class newsApi: ObservableObject {
    
    @Published var NewsData = [articles]()
    init() {
        getNews()
    }
    
    func getNews(){
        
        let request =  AF.request("https://newsapi.org/v2/top-headlines?country=gb&category=business&apiKey=25d97f157fdb4ea99929aa72bfb8f1a4")
        
        request.responseData { (data) in
            
            let json = try! JSON(data: data.data!)
//            let newJson = json["articles"].dictionary
            
            for x in 0...19{
                
                if let newsData = json["articles"][x].dictionary{

                    let news = articles(author: newsData["author"]!.description, title: newsData["title"]!.description, description: newsData["description"]!.description, url: newsData["url"]!.description, urlToImage: newsData["urlToImage"]!.description, publishedAt: newsData["publishedAt"]!.description, content: newsData["content"]!.description, show: false)
                    
                    self.NewsData.append(news)
                }
            }
                
        }
    
    
        }
    }


