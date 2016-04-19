//
//  UserAPIRouter.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation
import Alamofire

enum UserAPIRouter:URLRequestConvertible {
    
    static let baseURLString = "https://randomuser.me/api/"
    
    case GetUser()
    
    var URLRequest: NSMutableURLRequest  {
        switch self {
        case .GetUser():
            let URL = NSURL(string: UserAPIRouter.baseURLString)!
            let URLRequest = NSURLRequest(URL: URL)
            let encoding = Alamofire.ParameterEncoding.URL
            return encoding.encode(URLRequest, parameters: nil).0
        }
    }
    
}