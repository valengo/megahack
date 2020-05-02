//
//  EventBannerCell.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class EventBannerCell: UICollectionViewCell {
    
    static let identifier = "\(String(describing: EventBannerCell.self))"

    @IBOutlet weak var eventName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
