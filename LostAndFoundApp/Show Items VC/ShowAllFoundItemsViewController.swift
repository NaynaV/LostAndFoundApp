//
//  ShowAllFoundItemsViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/20/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class ShowAllFoundItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  

    @IBOutlet weak var tbl_FoundItems: UITableView!
    
    public static var foundItemArray: [FoundItem]!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!);
self.tbl_FoundItems.delegate = self
        self.tbl_FoundItems.dataSource = self
        self.tbl_FoundItems.reloadData()
        //getFoundItemData()
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShowAllFoundItemsViewController.foundItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fItemCell = tableView.dequeueReusableCell(withIdentifier: "ShowFoundItemCell") as! ShowFoundItemTableViewCell
        
        let foundItem = ShowAllFoundItemsViewController.foundItemArray[indexPath.row]
    fItemCell.lbl_fItemName.text = foundItem.fItemName
        fItemCell.lbl_fItemCat.text = foundItem.fItemCat
        fItemCell.lbl_fItemDes.text = foundItem.fItemDes
        fItemCell.lbl_fItemDate.text = foundItem.fItemDate
        fItemCell.lbl_fItemPlace.text = foundItem.fItemPlace
        return fItemCell
        
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }

}
