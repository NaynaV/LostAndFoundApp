//
//  SignupViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/5/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UINavigationBarDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate{

    
    @IBOutlet weak var txt_firstName: UITextField!
    @IBOutlet weak var txt_lastName: UITextField!
    
    @IBOutlet weak var txt_dob: UITextField!
    
    @IBOutlet weak var txt_emailIDsignup: UITextField!
    
    @IBOutlet weak var txt_passwordSignup: UITextField!
    
    
    @IBOutlet weak var txt_contactNo: UITextField!
    
    @IBOutlet weak var txt_address: UITextField!
    
    @IBOutlet weak var txt_city: UITextField!
   var datePicker = UIDatePicker()
    var rdate  = NSDate()
    var rtime = NSTimeZone()
    
    var Response2: AnyObject!
    
    var Response1: AnyObject!
    
  
    
   
  
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txt_dob.inputAccessoryView = toolbar
        txt_dob.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txt_dob.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
   
    
    @IBAction func txt_dobClick(_ sender: UITextField)
    {
        self.showDatePicker()
        
    }
    
   
    @IBAction func btn_Back(_ sender: UIBarButtonItem)
    {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(nextVC, animated: true, completion: nil)
    
    }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        // Do any additional setup after loading the view.
    }
    

  
}
