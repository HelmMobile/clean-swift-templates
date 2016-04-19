//
//  User.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation

final class User {
    let name:Name
    let email:String
    let phone:String
    let imageURLString:String
    
    init(name:Name,email:String,phone:String, imageURLString:String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.imageURLString = imageURLString
    }
}
