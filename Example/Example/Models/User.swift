//
//  User.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import Foundation

struct User {
    
    let name: Name
    let gender: String
    let email: String
    let mobile: String
    let imagePath: String
    let thumbImagePath: String
    
    init(name: Name, gender: String, email: String, mobile: String, imagePath: String, thumbImagePath: String) {
        self.name = name
        self.gender = gender
        self.email = email
        self.mobile = mobile
        self.imagePath = imagePath
        self.thumbImagePath = thumbImagePath
    }
}
