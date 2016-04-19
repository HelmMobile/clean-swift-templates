//
//  Name.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation

final class Name {
    let title:String
    let first:String
    let last:String
    
    init(title:String,first:String,last:String) {
        self.title = title
        self.first = first
        self.last = last
    }
    
    func fullName() -> String {
        return self.title + ". " + self.first + " " + self.last
    }
}