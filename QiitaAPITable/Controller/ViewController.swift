//
//  ViewController.swift
//  QiitaAPITable
//
//  Created by kosuke sakai on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {
    var articles: [Qiita] = []
    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        seachBar.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text ?? ""
        QiitaManager().getArticleData(query, completion: { returnData in
            self.articles = returnData
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(articles[indexPath.row].title)"
        return cell
    }
}
