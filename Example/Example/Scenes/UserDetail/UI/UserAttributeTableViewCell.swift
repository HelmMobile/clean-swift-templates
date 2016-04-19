//
//  UserAttributeTableViewCell.swift
//  Example
//
//  Created by Miguel Berrocal Gómez on 14/04/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class UserAttributeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(forAttribute attribute:UserDetail.ViewModel.Attribute) {
        textLabel?.text = attribute.title
        detailTextLabel?.text = attribute.value
    }
    
}
