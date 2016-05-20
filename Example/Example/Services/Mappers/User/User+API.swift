//
//  User+API.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation
import SwiftyJSON

extension User:ResponseObjectSerializable {
        
    struct ParsingKeys {
        static let results = "results"
        struct Picture {
            static let base = "picture"
            static let large = "large"
            static let thumbnail = "thumbnail"
        }
        
        static let email = "email"
        static let phone = "phone"
        static let nameData = "name"
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        let userJSON = json[ParsingKeys.results][0]
        guard let name = Name(json: userJSON[ParsingKeys.nameData])
            , let email = userJSON[ParsingKeys.email].string
            , let phone = userJSON[ParsingKeys.phone].string
            , let imageURLString = userJSON[ParsingKeys.Picture.base][ParsingKeys.Picture.large].string
            else {
                return nil
        }
        return User(name: name, email: email, phone: phone, imageURLString: imageURLString)
    }
}