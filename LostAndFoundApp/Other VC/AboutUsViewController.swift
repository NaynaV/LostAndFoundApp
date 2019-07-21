//
//  AboutUsViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/21/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

import WebKit

class AboutUsViewController: UIViewController {

   
    
    
    @IBOutlet weak var webView_aboutUs: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!);
        loadFromFile()
    }
    
    func loadFromFile()
    {
        let localfilePath = Bundle.main.url(forResource: "aboutUs", withExtension: "html")
        let myRequest = URLRequest(url: localfilePath!)
        webView_aboutUs.load(myRequest)
    
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
