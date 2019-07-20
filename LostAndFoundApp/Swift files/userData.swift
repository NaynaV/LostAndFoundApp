//
//  userData.swift
//  LostAndFoundApp
//
//  Created by Nayna on 7/15/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

class UsersStruct {
    // let userID : Int
    //var userName : String
    //var customerLName : String
    var email : String
    var password : String
    var listOfItems : Item
    
    static var usersListOfItems = [UsersStruct]()
    
    init()
    {
        
    }
    /*  var fullName : String{
     return "\(customerFName ) \(customerLName)"
     }*/
    
}
