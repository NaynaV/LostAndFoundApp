//
//  ViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/5/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit
class LoginViewController: UIViewController {

    
    @IBOutlet weak var txt_emailId: UITextField!
    
 
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    var UsersDict = [UsersStruct]()
    
    // getting user defaults reference
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad()
    {
        
        switchRememberMe.isOn = false
        getRememberMe()
        readCustomersPlistFile()
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        
    }

    
    
    @IBAction func btnSignup(_ sender: UIButton)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "signupVC") as! SignupViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
   
    @IBAction func btnLogin(_ sender: UIButton)
    {
        if let email = txt_emailId.text{
            if !email.isEmpty{
                
                if email.isVAlidEmail(){
                    if let password = txtPassword.text{
                        if !password.isEmpty{
                            if password.sizeCheck(){
                                
                                if  checkEmailPassword(email: email, password: password) {
                                    setRememberMe()
                                    
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
                                    
                                    self.navigationController?.pushViewController(dashboardVC, animated: true)
                                    
                                    
                                }else{
                                    showAlerBox(msg: "You have enter wrong credentials")
                                }
                                
                            }else{
                                showAlerBox(msg: "Invalid password size")
                            }
                            
                        }else{
                            showAlerBox(msg: "Please enter password")
                        }
                    }
                }
                else{
                    showAlerBox(msg: "Please enter valid email")
                }
            }else{
                showAlerBox(msg: "Please enter useremail")
            }
        }
    }
        func showAlerBox(msg : String)  {
            let alertController = UIAlertController(title: "Lost&FoundApp", message:
                msg, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        func readCustomersPlistFile(){
            
            let plist = Bundle.main.path(forResource: "userInfo", ofType: "plist")
            
            if let dict = NSMutableDictionary(contentsOfFile: plist!){
                if let Customers = dict["Users"] as? [[String:Any]]
                {
                    for customer in Customers {
                      
                        
                        let email = customer["emailID"] as! String
                        let password = customer["password"] as! String
                        self.UsersDict.append(UsersStruct(email: email, password: password))
                       
                    }
                }
            }
            
        }
        
        
        
        func checkEmailPassword(email : String , password : String) -> Bool{
            
            for everyCustomer in UsersDict{
                if (everyCustomer.email == email && everyCustomer.password == password) {
                    return true
                }
            }
            return false
        }
        
        func setRememberMe()  {
            if switchRememberMe.isOn {
                userDefault.set(self.txt_emailId.text, forKey: "emailID")
                userDefault.set(self.txtPassword.text, forKey: "password")
            }else{
                userDefault.set("", forKey: "emailID")
                userDefault.set("", forKey: "password")
            }
        }
        
        func getRememberMe()
        {
            let userDefault = UserDefaults.standard
            
            if let email = userDefault.string(forKey: "emailID")
            {
                txt_emailId.text = email
                
                if let password = userDefault.string(forKey: "passwordID")
                {
                    txtPassword.text = password
                    switchRememberMe.setOn(true, animated: false)
                }
            }
        }
        
    
    
 
    
  

}

