//
//  NotificationRepository.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import Foundation

class NotificationRepository: Repository {
    
    let localSource: NotificationLocalSource
    
    init(localSource: NotificationLocalSource = NotificationLocalSource()) {
        self.localSource = localSource
    }

    func getAll() -> [EventNotification] {
        return localSource.getAll()
    }
    
    func getAll() -> [Any] {
        let groupedBy = Dictionary(grouping: localSource.getAll(), by: {$0.group})
        
        let keys = ["Hoje", "Ontem", "Na semana"]
        
        var data: [Any] = []
        for key in keys {
            data.append(key)
            for value in groupedBy[key]! {
                data.append(value)
            }
        }
        return data
    }
    
    func get(identifier: Int) -> EventNotification? {
        return nil
    }
    
    func add(item: EventNotification) -> Bool {
        return false
    }
    
}
