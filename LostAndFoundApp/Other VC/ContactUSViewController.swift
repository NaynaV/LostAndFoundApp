//
//  ContactUSViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/21/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit
import MessageUI

class ContactUSViewController: UIViewController {

    
    
    @IBAction func btn_SMSClicked(_ sender: UIButton)
    {
        if MFMessageComposeViewController.canSendText() {
            
            
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Hello, How are you?"
            messageVC.recipients = ["+12268994436"]
            messageVC.messageComposeDelegate = self as! MFMessageComposeViewControllerDelegate
            
            self.present(messageVC, animated: false, completion: nil)
        }
        else{
            print("NO SIM available")
        }
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btn_CallClicked(_ sender: UIButton)
    {
        
        if let url = URL(string: "tel://+1123777777)"), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!);
        // Do any additional setup after loading the view.
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
