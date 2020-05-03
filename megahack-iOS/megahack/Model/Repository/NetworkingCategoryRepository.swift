//
//  NetworkingCategoryRepository.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import Foundation

class NetworkingCategoryRepository: Repository {
    
    let localSource: NetworkingCategoryLocalSource
    
    init(localSource: NetworkingCategoryLocalSource = NetworkingCategoryLocalSource()) {
        self.localSource = localSource
    }
    
    func getAll() -> [NetworkingCategory] {
        return localSource.getAll()
    }
    
    func get(identifier: Int) -> NetworkingCategory? {
        return nil
    }
    
    func add(item: NetworkingCategory) -> Bool {
        return false
    }
}
