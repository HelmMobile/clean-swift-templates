//
//  UserStoreWorker.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation

class UserStoreWorker {
    
    let store:UserStore
    
    init(store:UserStore) {
        self.store = store
    }
    
    func getUser(completionHandler:UserStoreGetUserCompletionHandler) {
        store.getUser(completionHandler)
    }
}