//
//  addFoundItemViewController.swift
//  LostAndFoundApp
//
//  Created by MacStudent on 2019-07-18.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class addFoundItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
   

   
    @IBOutlet weak var txt_itemCategory: UITextField!
     var categoryPicker = UIPickerView()
    
    var category = ["Electronics", "Kitchen", "Clothes", "Accesories"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
       // imageController.delegate = self
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
    
    
    @IBAction func btn_backClick(_ sender: UIBarButtonItem)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    @IBAction func btn_saveClick(_ sender: UIBarButtonItem) {
    }
    
    
}
