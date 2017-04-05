//
//  UserDetailViewController+TableView.swift
//  Example
//
//  Created by Joel on 06/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import UIKit
import Kingfisher

extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atributes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let atributeCell = tableView.dequeueReusableCell(withIdentifier: "AtributeCell") {
            atributeCell.textLabel?.text = atributes[indexPath.row].title
            atributeCell.detailTextLabel?.text = atributes[indexPath.row].value
            
            return atributeCell
        }
        
        return UITableViewCell()
    }
    
}
