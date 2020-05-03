//
//  CategoryCell.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    static let identifier = "\(String(describing: CategoryCell.self))"

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var illustrationImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
