//
//  UserNetworkRouter.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import Foundation
import Alamofire

enum UserNetworkRouter:URLRequestConvertible {
    
    static let baseURL = "https://randomuser.me/api/"
    
    case getUser()
    
    func asURLRequest() throws -> URLRequest {
        var request: URLRequest!
        
        switch self {
        case .getUser():
            let url = URL(string: UserNetworkRouter.baseURL)!
            request = URLRequest(url: url)
            request.httpMethod = "GET"
        }
        
        return try Alamofire.URLEncoding().encode(request, with: nil)
    }
}
