//
//  FieldRepository.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

class FieldRepository: Repository {
    
    let localSource: FieldLocalSource
    
    init(localSource: FieldLocalSource = FieldLocalSource()) {
        self.localSource = localSource
    }
    
    func getAll() -> [Field] {
        return localSource.getAll()
    }
    
    func get(identifier: Int) -> Field? {
        return nil;
    }
    
    func add(item: Field) -> Bool {
        return false;
    }
}
