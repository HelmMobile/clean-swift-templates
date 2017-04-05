//
//  Name+API.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Name: ResponseObjectSerializable {
    
    init?(fromJSON json: JSON) {
        
        guard let firstName = json["first"].string
            ,let lastName = json["last"].string
            ,let title = json["title"].string else {
                return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
    }
    
}
