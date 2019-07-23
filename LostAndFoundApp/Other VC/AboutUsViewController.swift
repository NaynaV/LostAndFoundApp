//
//  AboutUsViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/21/19.
//  Copyright © 2019 Nayna. All rights reserved.
//
import UIKit
  
import WebKit


class AboutUsViewController:  UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localfilePath = Bundle.main.url(forResource: "aboutus", withExtension: "html")
        let myRequest = URLRequest(url: localfilePath!)
        webView.load(myRequest)
    }
    
    
}
