//
//  UserNetworkStore.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import Foundation
import Alamofire

class UserNetworkStore: UserStore {
    
    func getUser(completion: @escaping UserStoreGetUserCompletionHandler) {
        _ = Alamofire.request(UserNetworkRouter.getUser())
            .validate()
            .responseObject { (response: DataResponse<User>) in
                switch response.result {
                case .success(let user):
                    completion(.success(result: user))
                case .failure(let error):
                    completion(.failure(error: UserStoreError.cannotGet("Cannot get user \(error)")))
                }
        }
        
    }
    
}
