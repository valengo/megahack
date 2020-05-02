//
//  RoundedButton.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        withRoundedBorder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        withRoundedBorder()
    }
    
    func withRoundedBorder() {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
}
