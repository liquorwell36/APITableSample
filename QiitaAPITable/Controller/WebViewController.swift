//
//  WebViewController.swift
//  QiitaAPITable
//
//  Created by kosuke sakai on 2021/11/04.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var url: String = "https://apple.com"
    @IBOutlet weak var webView: WKWebView!
        
    @IBAction func backToTable(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        let myURL = URL(string: url)
        print("url: \(url)")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

extension WebViewController: WKUIDelegate {
    
}
