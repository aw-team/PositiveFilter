//
//  ViewController.swift
//  happy-filter
//
//  Created by Takaaki Yoshioka on 2015/10/04.
//  Copyright © 2015年 JBS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var Searchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        webview.delegate = self
        Searchbar.delegate = self
        
        // リクエストを生成する
        let urlStr = "http://headlines.yahoo.co.jp/hl?a=20150929-00000102-dal-base"
        self.loadWebPage(urlStr)
        Searchbar.text = urlStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //サーチボタンクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.isFirst = true
        
        let urlStr: String? = Searchbar.text
        self.loadWebPage(urlStr!)
    }
    
    private var isFirst = true
    func webViewDidFinishLoad(webView: UIWebView) {
        if (!self.isFirst) {
            return
        }
        
        self.isFirst = false
        
        let jQuery = self.readFileText("jquery-2.1.4.min")
        self.webview.stringByEvaluatingJavaScriptFromString(jQuery)

        let filter = self.readFileText("positive-filter")
        self.webview.stringByEvaluatingJavaScriptFromString(filter)
    }
    
    private func readFileText(resName: String) -> String {
        var str = ""
        
        if let path = NSBundle.mainBundle().pathForResource(resName, ofType: "js") {
            let data = try! NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String
            data.enumerateLines { (line, stop) -> () in
                str += line
            }
        }
        
        return str
    }
    
    private func loadWebPage(urlStr: String) {
        
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(URL: url!)
        
        // 指定したページを読み込む
        webview.loadRequest(request)
    }
}

