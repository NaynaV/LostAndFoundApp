//
//  addFoundItemViewController.swift
//  LostAndFoundApp
//
//  Created by MacStudent on 2019-07-18.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit
import MobileCoreServices

class addFoundItemViewController: UIViewController,UIImagePickerControllerDelegate,UIActionSheetDelegate, UIAlertViewDelegate,UINavigationBarDelegate,UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate
{
   

   
    @IBOutlet weak var txt_itemCategory: UITextField!
    
    @IBOutlet weak var txt_itemName: UITextField!
    
    @IBOutlet weak var txt_fitemPlace: UITextField!
    
    @IBOutlet weak var txt_fItemDate: UITextField!
    
    @IBOutlet weak var txt_fItemHint: UITextField!
    var categoryPicker = UIPickerView()
    
    var category = ["Electronics", "Kitchen", "Clothes", "Accesories"]
    
    let datePicker = UIDatePicker()
    var CategoryPicker = UIPickerView()
    // var datePicker = UIDatePicker()
    var rdate  = NSDate()
    var rtime = NSTimeZone()
    var Response2: AnyObject!
    
    var Response1: AnyObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        showDatePicker()
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        
       txt_itemCategory.inputView = categoryPicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    
    func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txt_itemCategory.text = category[row]
        self.view.endEditing(false)
        
        //print(category[row])
    }
    
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
        
        txt_fItemDate.inputAccessoryView = toolbar
        txt_fItemDate.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txt_fItemDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func btn_backClick(_ sender: UIBarButtonItem)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    @IBAction func btn_saveClick(_ sender: UIBarButtonItem) {
    }
    
    
}
