//
//  UserProfileRepository.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import Foundation

class UserProfileRepository: Repository {

    let localSource: UserProfileLocalSource
    
    init(localSource: UserProfileLocalSource = UserProfileLocalSource()) {
        self.localSource = localSource
    }
    
    func getAll() -> [UserProfile] {
        return localSource.getAll()
    }
    
    func get(identifier: Int) -> UserProfile? {
        return nil
    }
    
    func add(item: UserProfile) -> Bool {
        return false
    }
}
