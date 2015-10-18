//
//  ViewController.swift
//  happy-filter
//
//  Created by Takaaki Yoshioka on 2015/10/04.
//  Copyright © 2015年 JBS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // リクエストを生成する
        let url = NSURL(string: "http://headlines.yahoo.co.jp/hl?a=20150929-00000102-dal-base")
        let request = NSURLRequest(URL: url!)
        
        // 指定したページを読み込む
        webview.delegate = self
        webview.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

