//
//  addLostItemViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/7/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class addLostItemViewController: UIViewController,UIImagePickerControllerDelegate,UIActionSheetDelegate, UIAlertViewDelegate,UINavigationBarDelegate,UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate
{
    

   
    
    @IBOutlet weak var txt_itemName: UITextField!
    @IBOutlet weak var txt_category: UITextField!
    
    @IBOutlet weak var txt_place: UITextField!
    
    @IBOutlet weak var txt_dateLostItem: UITextField!
    @IBOutlet weak var txt_reward: UITextField!
    @IBOutlet weak var txt_description: UITextField!
    
    @IBOutlet weak var img_item: UIImageView!
     var imageFlag : Bool = false
    
    @IBOutlet weak var categoryPicker: UIPickerView!
 
  
    var imageController = UIImagePickerController()
    var img_dataDic = NSMutableDictionary()
    var parameterDic = NSMutableDictionary()
    var img_data = NSData()
      //var category = ["General", "Electronic", "Materialistic"]
    
    

    let category = [String](arrayLiteral: "Peter", "Jane", "Paul", "Mary", "Kevin", "Lucy")
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        
        txt_category.inputView = categoryPicker
        
        imageController.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        // Do any additional setup after loading the view.
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
   
    /*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        img_item.image = image
        dismiss(animated:true, completion: nil)
    }
    /*
    private func imagePickerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        imageController.dismiss(animated: true, completion: nil)
        
        //        var imag_var =  info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        
        
        //        img_data = UIImagePNGRepresentation(imag_var)!
        //        print(img_data)
        
        
        let imag_var =  info[UIImagePickerControllerOriginalImage] as! UIImage
        img_item.contentMode = .scaleToFill
        img_item.image = imag_var
        img_data = UIImagePNGRepresentation(imag_var)!
        img_dataDic.setObject(img_data, forKey: "isImageupload" as NSCopying)
        imageFlag = true
        //         btn_upldimg.setBackgroundImage(imag_var, forState: UIControlState.Normal)
        
        
        
    }
    
  */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        imageController.dismiss(animated: true, completion: nil)
    }
    
    */
    
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
        self.txt_category.text = category[row]
    }
    
    
    @IBAction func btn_back(_ sender: Any) {
    
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    
    }
    @IBAction func btn_saveLostItem(_ sender: UIButton)
    {
       // let itemID : Int = txt_place?.text
        let itemDes : String = txt_description.text!
        let itemName : String = txt_itemName.text!
        let itemCat : String = txt_category.text!
        
    }
    
    
}
