//
//  User+API.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import Foundation
import SwiftyJSON

extension User: ResponseObjectSerializable {
    
    init?(fromJSON json: JSON) {
        
        let userData = json["results"][0]
        let nameData = userData["name"]
        
        guard let mobile = userData["cell"].string
            ,let email = userData["email"].string
            ,let gender = userData["gender"].string
            ,let imagePath = userData["picture"]["large"].string
            ,let thumbImagePath = userData["picture"]["thumbnail"].string
            ,let name = Name(fromJSON: nameData) else {
                
                return nil
        }
        
        self.mobile = mobile
        self.email = email
        self.gender = gender
        self.imagePath = imagePath
        self.thumbImagePath = thumbImagePath
        self.name = name
    }
}
