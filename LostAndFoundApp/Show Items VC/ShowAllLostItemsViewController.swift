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
     self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!);
    
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
        
        
     
        cell.lbl_ItemName.text = "Name : \(lostItem.ItemName)"
        cell.lbl_itemLostdate.text = "Lost Date : \(lostItem.ItemLostDate)"
        cell.lbl_itemDes.text = "Description : \(lostItem.ItemDescription)"
        cell.lbl_itemLostPlace.text = "Place : \(lostItem.ItemLostPlace)"
        cell.lbl_itemImage.image = UIImage(named: (lostItem.ItemImage))
        cell.lbl_itemReward.text = "Reward : \(lostItem.ItemReward)"
        cell.lbl_itemCat.text = "Category : \(lostItem.ItemCat)"
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250)
    }
    private func getLostItemData()
    {
        LostItemArray = []
        LostItemArray.append(Item(ItemName: "Iphone", ItemDescription: "Iphone ^s roseGold", ItemCat : "Electronics", ItemReward: "$40", ItemLostDate: Date(), ItemImage: "keyImage", ItemLostPlace: "graydon hall", ItemLostContact: "236900899"))
        
        LostItemArray.append(Item(ItemName: "cap", ItemDescription: "Nike Cap", ItemCat: "Clothes", ItemReward: "$10", ItemLostDate: Date(), ItemImage: "purseImage", ItemLostPlace: "graydon hall", ItemLostContact: "236900899"))
    }
    
    
    @IBAction func btn_back(_ sender: UIBarButtonItem)
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
   
}
