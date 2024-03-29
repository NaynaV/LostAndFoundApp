//
//  addLostItemViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/7/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit
import MobileCoreServices

class addLostItemViewController: UIViewController,UIImagePickerControllerDelegate,UIActionSheetDelegate, UIAlertViewDelegate,UINavigationBarDelegate,UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate
{

   
    
    @IBOutlet weak var txt_itemName: UITextField!
    @IBOutlet weak var txt_category: UITextField!
    
    @IBOutlet weak var txt_place: UITextField!
    @IBOutlet weak var txt_PhoneNumber: UITextField!
    
    @IBOutlet weak var txt_dateLostItem: UITextField!
    @IBOutlet weak var txt_reward: UITextField!
    @IBOutlet weak var txt_description: UITextField!
    
    @IBOutlet weak var img_item: UIImageView!
     var imageFlag : Bool = false
    
  var categoryPicker = UIPickerView()
 
  
    var imageController = UIImagePickerController()
    var img_dataDic = NSMutableDictionary()
    var parameterDic = NSMutableDictionary()
    var img_data = NSData()
     
    
    let datePicker = UIDatePicker()
    // var datePicker = UIDatePicker()
    var rdate  = NSDate()
    var rtime = NSTimeZone()
    var Response2: AnyObject!
    
    var Response1: AnyObject!

    var category = ["Electronics", "Kitchen", "Clothes", "Accesories"]
    var categoryChosen : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        
        showDatePicker()
        imageController.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        
        txt_category.inputView = categoryPicker
    
     
    }
    
    @IBAction func btn_imagePick(_ sender: Any)
    {
    
        self.view.endEditing(true)
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Image", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Take Photo", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            
            self.view.endEditing(true)
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            {
                if self.navigationController?.presentedViewController == self.imageController
                {
                }
                else
                {
                    self.imageController.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                    self.imageController.sourceType = UIImagePickerController.SourceType.camera
                    self.imageController.allowsEditing = true
                    
                    self.present(self.imageController, animated: true, completion: nil)
                }
            }
            else
            {
                let alert : UIAlertController = UIAlertController(title: "Alert Message", message:"Camera Not available", preferredStyle: UIAlertController.Style.alert)
                
                let validation : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: { (action) -> Void in
                    
                    alert.dismiss(animated: true, completion: nil)
                })
                alert.addAction(validation)
                self.present(alert, animated: true, completion: nil)
            }
        })
        
        let libraryAction = UIAlertAction(title: "Choose From Library", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            
            self.view.endEditing(true)
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)
            {
                self.imageController.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
                self.imageController.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum;
                self.imageController.allowsEditing = false
                
                self.present(self.imageController, animated: true, completion: nil)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
            self.view.endEditing(true)
        })
        optionMenu.addAction(libraryAction)
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        
    }
   
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.img_item.image = image
                //Save Image if taken from Camera
                if (imageFlag == true) {
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
                } else if mediaType.isEqual(to: kUTTypeMovie as String) {
                    // Code to support video here
                }
            }else{
                print("Something went wrong")
            }
            
            //Display all keys
            for (k, _) in info {
                print("TEST - \(k)")
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        @objc func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
            
            if error != nil {
                let alert = UIAlertController(title: "Save Failed",
                                              message: "Failed to save image",
                                              preferredStyle: UIAlertController.Style.alert)
                
                let cancelAction = UIAlertAction(title: "OK",
                                                 style: .cancel, handler: nil)
                
                alert.addAction(cancelAction)
                self.present(alert, animated: true,
                             completion: nil)
            }
        
    }
    
    
    @IBAction func addItem(_ sender: Any)
    {
        ShowAllLostItemsViewController.LostItemArray.append(Item(ItemName: txt_itemName.text!, ItemDescription: txt_description.text!, ItemCat: categoryChosen, ItemReward: txt_reward.text!, ItemLostDate: rdate as Date, ItemImage: self.img_item.image! , ItemLostPlace: txt_place.text!, ItemLostContact: txt_PhoneNumber.text!))
        self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showAllLostItemsVC = storyboard.instantiateViewController(withIdentifier: "AllLostItemVC") as! ShowAllLostItemsViewController
        self.navigationController?.pushViewController(showAllLostItemsVC, animated: true)
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
       txt_category.text = category[row]
        categoryChosen = category[row]
        self.view.endEditing(false)
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    txt_category.text = category[row]
        categoryChosen = category[row]
    self.txt_category.resignFirstResponder()
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
        
        txt_dateLostItem.inputAccessoryView = toolbar
        txt_dateLostItem.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txt_dateLostItem.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func btn_back(_ sender: Any) {
    
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    
    }
    
    
    
}

