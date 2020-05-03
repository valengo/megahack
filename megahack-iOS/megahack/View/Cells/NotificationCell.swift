//
//  NotificationCell.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    static let identifier = "\(String(describing: NotificationCell.self))"
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationTime: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
