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


    public static var LostItemArray = [Item]()
    
    @IBOutlet weak var tbl_showLostItems: UITableView!
    
  
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
     self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!);
    
    self.tbl_showLostItems.delegate = self
    self.tbl_showLostItems.dataSource = self
    self.tbl_showLostItems.reloadData()
  //  tbl_showLostItems.register(UITableViewCell.self, forCellReuseIdentifier: "cellLostItems")
    

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
    return ShowAllLostItemsViewController.LostItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLostItems") as! ShowLostItemsTableViewCell
        let lostItem = ShowAllLostItemsViewController.LostItemArray[indexPath.row]
        
        
     
        cell.lbl_ItemName.text = "\(lostItem.ItemName)"
        cell.lbl_itemLostdate.text = "\(lostItem.ItemLostDate)"
        cell.lbl_itemDes.text = "\(lostItem.ItemDescription)"
        cell.lbl_itemLostPlace.text = "\(lostItem.ItemLostPlace)"
        cell.lbl_itemImage.image = lostItem.ItemImage
        cell.lbl_itemReward.text = "\(lostItem.ItemReward)"
        cell.lbl_itemCat.text = "\(lostItem.ItemCat)"
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250)
    }
    
    
    
    @IBAction func btn_back(_ sender: UIBarButtonItem)
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        self.navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
   
}
