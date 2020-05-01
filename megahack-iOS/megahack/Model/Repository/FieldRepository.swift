//
//  FieldRepository.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

class FieldRepository: Repository {
    
    func getAll() -> [Field] {
        return []
    }
    
    func get(identifier: Int) -> Field? {
        return nil;
    }
    
    func create(a: Field) -> Bool {
        return false;
    }
    
    func update(a: Field) -> Bool {
        return false;
    }
    
    func delete(a: Field) -> Bool {
        return false;
    }
}
