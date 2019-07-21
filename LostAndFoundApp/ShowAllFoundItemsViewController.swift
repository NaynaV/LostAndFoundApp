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
    
    var foundItemArray: [FoundItem]!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.tbl_FoundItems.delegate = self
        self.tbl_FoundItems.dataSource = self
        getFoundItemData()
        // Do any additional setup after loading the view.
    }
    
    private func getFoundItemData()
    {
        foundItemArray = []
        foundItemArray.append(FoundItem(fItemName: "key", fItemCat: "Personal", fItemDes: "shhsd", fItemDate: "dsds"))
       foundItemArray.append(FoundItem(fItemName: "Bottel", fItemCat: "Home", fItemDes: "water blue bttel", fItemDate: "sfdss"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foundItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fItemCell = tableView.dequeueReusableCell(withIdentifier: "ShowFoundItemCell") as! ShowFoundItemTableViewCell
        
        let foundItem = self.foundItemArray[indexPath.row]
    fItemCell.lbl_fItemName.text = foundItem.fItemName
        fItemCell.lbl_fItemCat.text = foundItem.fItemCat
        fItemCell.lbl_fItemDes.text = foundItem.fItemDes
        fItemCell.lbl_fItemDate.text = foundItem.fItemDate
        return fItemCell
        
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }

}
