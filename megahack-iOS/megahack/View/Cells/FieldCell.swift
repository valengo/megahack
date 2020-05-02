//
//  FieldCell.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class FieldCell: UICollectionViewCell {
    
    static let identifier = "\(String(describing: FieldCell.self))"
        
    @IBOutlet weak var label: UILabel!
    
    var item: Field?
    
    public func bind(item: Field) {
        self.item = item
        
        label.text = item.description
        
        if (item.isSelected) {
            contentView.backgroundColor = UIColor(named: "LightRed")
            label.textColor = UIColor(named: "FieldLabelTextHighlight")
        } else {
            contentView.backgroundColor = UIColor(named: "FieldBackground")
            label.textColor = UIColor(named: "FieldLabelText")
        }
    }
}
