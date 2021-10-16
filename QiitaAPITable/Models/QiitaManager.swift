//
//  QiitaManager.swift
//  ApiTableSample
//
//  Created by kosuke sakai on 2021/10/16.
//

import Foundation

class QiitaManager {
    let baseURL = "https://qiita.com/api/v2/items?page=1"
    var articles: [Qiita] = []
    
    func getArticleData(_ query: String, completion: @escaping ([Qiita]) -> Void)  {
        if let url = URL(string: baseURL + "&query=\(query)") {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if let error = error {
                    print("Client Error: \(error)")
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    print("no data or no response")
                    return
                }
                
                if response.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let results = try!  decoder.decode([Qiita].self, from: data)
                    //self.articles = results
                    //print("Articles: \(self.articles)")
                    completion(results)
                } else {
                    print("サーバエラー ステータスコード: \(response.statusCode)\n")
                }
            })
            task.resume()
            //print("QiitaManager: \(articles)")
        } else {
            print("URLエラー")
        }
    }
    
}
