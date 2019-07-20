//
//  ShowLostItemsTableViewCell.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/20/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class ShowLostItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_itemId: UILabel!
    
    @IBOutlet weak var lbl_ItemName: UILabel!
    
    @IBOutlet weak var lbl_itemType: UILabel!
    @IBOutlet weak var lbl_itemCat: UILabel!
    
    @IBOutlet weak var lbl_itemDes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
