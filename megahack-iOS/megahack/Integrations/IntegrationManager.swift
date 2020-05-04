//
//  IntegrationsHandler.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class IntegrationManager {
    
    public static let shared = IntegrationManager()
    
    private init() {}
    
    func open(url: String, for tool: RealTimeType) {
        open(url: url)
    }
    
    func open(url: String, for media: SocialMediaType) {
        open(url: url)
    }
    
    func open(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}


