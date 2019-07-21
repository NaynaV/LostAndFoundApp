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


    var LostItemArray = [Item]()
    
    @IBOutlet weak var tbl_showLostItems: UITableView!
    
  
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
    
    self.tbl_showLostItems.delegate = self
    self.tbl_showLostItems.dataSource = self
  //  tbl_showLostItems.register(UITableViewCell.self, forCellReuseIdentifier: "cellLostItems")
    getLostItemData()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   func AddLostItem()
   {
    
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
       //   return self.students.count
    return self.LostItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLostItems") as! ShowLostItemsTableViewCell
        let lostItem = self.LostItemArray[indexPath.row]
        
        
     
        cell.lbl_ItemName.text = "Item Name :\(lostItem.ItemName)"
        cell.lbl_itemLostdate.text = "Item Category :\(lostItem.ItemLostDate)"
        cell.lbl_itemDes.text = "Item Description :\(lostItem.ItemDescription)"
        cell.lbl_itemLostPlace.text = "Lost Place:\(lostItem.ItemLostPlace)"
        cell.lbl_itemImage.image = UIImage(named: (lostItem.ItemImage))
        cell.lbl_itemReward.text = "Reward :\(lostItem.ItemReward)"
        
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(300)
    }
    private func getLostItemData()
    {
        LostItemArray = []
       LostItemArray.append(Item(ItemName: "Iphone", ItemDescription: "Iphone ^s roseGold", ItemReward: "$40", ItemLostDate: Date(), ItemImage: "keyImage", ItemLostPlace: "graydon hall", ItemLostContact: "236900899"))
        
         LostItemArray.append(Item(ItemName: "cap", ItemDescription: "Nike Cap", ItemReward: "$10", ItemLostDate: Date(), ItemImage: "purseImage", ItemLostPlace: "graydon hall", ItemLostContact: "236900899"))
    }
   
}
