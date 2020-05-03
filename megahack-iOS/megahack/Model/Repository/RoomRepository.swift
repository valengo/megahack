//
//  RoomRepository.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import Foundation

class RoomRepository: Repository {
    
    let localSource: RoomLocalSource
    
    init(source: RoomLocalSource = RoomLocalSource()) {
        self.localSource = source
    }
    
    func get(identifier: Int) -> Room? {
        return nil
    }
    
    func add(item: Room) -> Bool {
        return false
    }
    
    func getAll() -> [Room] {
        return localSource.getAll()
    }
}
