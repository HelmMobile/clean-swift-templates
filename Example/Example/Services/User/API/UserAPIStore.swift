//
//  UserAPIStore.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation
import Alamofire

class UserAPIStore:UserStore {
        
    func getUser(completionHandler: UserStoreGetUserCompletionHandler) {
        Alamofire.request(UserAPIRouter.GetUser())
            .validate()
            .responseObject { (response: Response<User, NSError>) in
                switch response.result {
                case .Success(let user):
                    completionHandler(result: UserStoreResult.Success(result: user))
                case.Failure(_):
                    completionHandler(result: UserStoreResult.Failure(error: UserStoreError.CannotGet("Cannot get new User")))

                }
        }
    }
}