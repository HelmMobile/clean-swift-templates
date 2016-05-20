//
//  Name+API.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Name {
    
    
    struct ParsingKeys {
        static let title = "title"
        static let first = "first"
        static let last = "last"
    }
    
    convenience init?(json:JSON) {
        guard let title = json[ParsingKeys.title].string
        , let first = json[ParsingKeys.first].string
        , let last = json[ParsingKeys.last].string
            else {
                return nil
        }
        
        self.init(title: title.capitalizedString, first: first.capitalizedString, last: last.capitalizedString)
    }
    
}