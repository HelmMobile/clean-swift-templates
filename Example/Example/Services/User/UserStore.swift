//
//  UserStore.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation

protocol UserStore {
    // MARK: CRUD operations - Optional error
    
    
    //func getUsers(completionHandler: (users: [User], error: UserStoreError?) -> Void)
    
    
    // MARK: CRUD operations - Generic enum result type
    func getUser(completionHandler: UserStoreGetUserCompletionHandler)
}

typealias UserStoreGetUserCompletionHandler = (result: UserStoreResult<User>) -> Void

enum UserStoreResult<U>
{
    case Success(result: U)
    case Failure(error: UserStoreError)
}


enum UserStoreError: Equatable, ErrorType
{
    case CannotGet(String)
}

func ==(lhs: UserStoreError, rhs: UserStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotGet(let a), .CannotGet(let b)) where a == b: return true
    default: return false
    }
}