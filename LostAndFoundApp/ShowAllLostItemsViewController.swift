//
//  ShowAllLostItemsViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/15/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class ShowAllLostItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var students = [Student]()


    var ItemArray = [Item]()
    
    @IBOutlet weak var tbl_showLostItems: UITableView!
    
  
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
    
    self.tbl_showLostItems.delegate = self
    self.tbl_showLostItems.dataSource = self
  //  tbl_showLostItems.register(UITableViewCell.self, forCellReuseIdentifier: "cellLostItems")
    readStudentInfoPlistFile()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
       //   return self.students.count
    return self.ItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLostItems") as! ShowLostItemsTableViewCell
        let showItem = self.ItemArray[indexPath.row]
        
        cell.lbl_itemId.text = "Item Id :\(showItem.ItemId)"
        cell.lbl_ItemName.text = "Item Name :\(showItem.ItemName)"
        cell.lbl_itemCat.text = "Item Category :\(showItem.ItemCat)"
        cell.lbl_itemDes.text = "Item Description :\(showItem.ItemDescription)"
       
        
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(300)
    }
  
    func readStudentInfoPlistFile()
    {
        if let plist = Bundle.main.path(forResource: "LostItem", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                if let showItems = dict["Items"] as? [[String:Any]]
                {
                    for showItem in showItems
                    {
                        let itemId = showItem["ItemId"] as! Int
                        let itemName = showItem["ItemName"] as! String
                        let itemCat = showItem["ItemCat"] as! String
                        let itemDes = showItem["ItemDescription"] as! String
                        
                        self.ItemArray.append(Item(ItemId: itemId, ItemName: itemName, ItemDescription: itemDes, ItemCat: itemCat))
                        
                        self.tbl_showLostItems.reloadData()
                    }
                }
            }
        }
    }
}
