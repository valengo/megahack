//
//  NotificationManager.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class AlertBuilder {
    
    static let shared = AlertBuilder()
    
    private init() {}
    
    func build(with title: String, and message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Entendi", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
}


