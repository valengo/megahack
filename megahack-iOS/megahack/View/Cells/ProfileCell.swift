//
//  ProfileCell.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

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
    
    func selected() {
        if let url = user?.social.url, let socialMedia = user?.social.type {
            IntegrationManager.shared.open(url: url, for: socialMedia)
        }
    }
}
