//
//  ShowAllLostItemsViewController.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/15/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class ShowAllLostItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    
    @IBOutlet weak var tbl_showLostItems: UITableView!
    
   @IBOutlet weak var cell_showLostItems: UITableView!
    
    
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   <#code#>
    }
  

}
