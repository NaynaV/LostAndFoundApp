//
//  ShowFoundItemTableViewCell.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/20/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class ShowFoundItemTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_fItemName: UILabel!
    
    @IBOutlet weak var lbl_fItemCat: UILabel!
    @IBOutlet weak var lbl_fItemDes: UILabel!
    @IBOutlet weak var lbl_fItemPlace: UILabel!
    
    
    @IBOutlet weak var lbl_fItemDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
