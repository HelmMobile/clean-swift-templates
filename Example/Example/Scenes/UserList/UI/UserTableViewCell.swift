//
//  UserTableViewCell.swift
//  Example
//
//  Created by Joel on 06/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func set(user: UserListScene.GetUser.ViewModel.User) {
        self.userName.text = user.name
        self.userEmail.text = user.email
        
        if let url = URL(string: user.imagePath) {
            self.userImage.kf.setImage(with: url)
        }
    }
}
