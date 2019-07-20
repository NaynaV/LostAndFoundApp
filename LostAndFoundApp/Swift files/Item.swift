//
//  Item.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/15/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

enum ItemType {
    case Lost , Found
}

class Item
{
    var itemId: Int
    var itemCategory: String
    var itemType : ItemType
    var itemName: String
    var description: String
    //
    var date : String
    var image  : String
    
    init()
    {
        self.itemId = Int()
        self.itemCategory = String()
        self.itemType = ItemType.Found
        self.itemName = String()
        self.description = String()
        self.date = String()
        self.image = String()
    }
    
    init(itemID:Int, itemCategory : String, itemType : ItemType , itemName :String, description : String , date : String , image : String)
    {
        self.itemId = itemID
        self.itemCategory = itemCategory
        self.itemName = itemName
        self.description = description
        self.date = date
        self.image = image
        self.itemType = itemType
    }
}
