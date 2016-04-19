//
//  UserListTableViewController.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

extension UserListViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifiers.userCell) as? UserTableViewCell {
            let user = users[indexPath.row]
            cell.configure(forUser: user)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedUserAtIndex(indexPath.row)
    }
}