//
//  ShowAllLostItemsViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/15/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class ShowAllLostItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    var ItemArray = Array<Item>()
    
    @IBOutlet weak var tbl_showLostItems: UITableView!
    
  
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
    
    self.tbl_showLostItems.delegate = self
    self.tbl_showLostItems.dataSource = self
  //  tbl_showLostItems.register(UITableViewCell.self, forCellReuseIdentifier: "cellLostItems")
    

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
       // return ItemArray.count
    return ItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLostItems", for: indexPath)
        
      //  print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
        var details = ""
        
        cell.textLabel?.text = ItemArray[indexPath.row].itemId
         cell.textLabel?.text = ItemArray[indexPath.row].itemName
         cell.textLabel?.text = ItemArray[indexPath.row].itemCategory
         cell.textLabel?.text = ItemArray[indexPath.row].description
      
        
        
        return cell
        
    }
  

}
