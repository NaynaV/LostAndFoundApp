//
//  MenuViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/5/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var txtfld1: UITextField!
  
    @IBOutlet weak var menuview: UIView!
    
    
    @IBAction func btn_menuClicked(_ sender: UIBarButtonItem)
    {
        if(i==0)
        {
            UIView.animate(withDuration: 0.4, animations:{
                self.menuview.frame = CGRect(x: self.menuview.frame.origin.x + self.menuview.bounds.width, y: self.menuview.frame.origin.y, width:self.menuview.bounds.width, height: self.menuview.bounds.height)
                
                
            })
            i=1
        }
        else{
            UIView.animate(withDuration: 0.4, animations:{
                self.menuview.frame = CGRect(x: self.menuview.frame.origin.x - self.menuview.bounds.width, y: self.menuview.frame.origin.y, width:self.menuview.bounds.width, height: self.menuview.bounds.height)
                
                
            })
            i=0
            print(self.menuview .frame.origin.x)
        }

    }
    
     var i:Int=0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!); self.navigationController?.navigationBar.isHidden = true
        self.menuview.frame = CGRect(x: 0 - self.menuview.bounds.width, y: self.menuview.frame.origin.y, width:self.menuview.bounds.width, height: self.menuview.bounds.height)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_addLostItem(_ sender: UIButton)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "addLostItemVC") as! addLostItemViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func btn_addFoundItem(_ sender: UIButton)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "addFoundItemVC") as! addFoundItemViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    @IBAction func btn_showFoundItems(_ sender: UIButton)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "ShowFoundItemVC") as! ShowAllFoundItemsViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    @IBAction func btn_contactUsClicked(_ sender: Any)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "ContactUSVC") as! ContactUSViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func btn_aboutUsClicked(_ sender: Any)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "aboutUsVC") as! AboutUsViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
}
