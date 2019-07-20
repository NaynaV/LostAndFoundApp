//
//  Item.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/15/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation
/*
enum ItemType {
    case Lost , Found
}

class Item
{
    var itemId: String
    var itemCategory: String
    var itemType : ItemType
    var itemName: String
    var description: String
    //
    var date : Date
    var image  : String
    
    var ItemArray:[Item] = [Item]()
    
    init()
    {
        self.itemId = String()
        self.itemCategory = String()
        self.itemType = ItemType.Found
        self.itemName = String()
        self.description = String()
        self.date = Date()
        self.image = String()
    }
    
    init(itemID:String, itemCategory : String, itemType : ItemType , itemName :String, description : String , date : Date , image : String)
    {
        self.itemId = itemID
        self.itemCategory = itemCategory
        self.itemName = itemName
        self.description = description
        self.date = Date()
        self.image = image
        self.itemType = itemType
        
    }
}
*/


struct Item {
    var ItemId: Int
    var ItemName: String
    var ItemDescription: String
    var ItemCat : String
    var ItemType : String
}
