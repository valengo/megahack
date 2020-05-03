//
//  ProfileCell.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    static let identifier = "\(String(describing: ProfileCell.self))"

    var user: UserProfile?
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    
    
    func bind(user: UserProfile) {
        self.user = user
        
        profilePic.image = UIImage(named: user.imageName)
        nameLabel.text = user.name
        fieldLabel.text = user.field
    }
}
