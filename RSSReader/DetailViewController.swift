//
//  DetailViewController.swift
//  RSSReader
//
//  Created by Yogiswara Utama on 7/13/15.
//  Copyright (c) 2015 RssReader. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var webView: UIWebView!
  


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = detailItem {
            if let myWebView = webView{
            let url = NSURL(string: detail as! String)
            let request = NSURLRequest(URL: url!)
            println(request)
            webView.scalesPageToFit = true
            webView.loadRequest(request)
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        println(detailItem)
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

