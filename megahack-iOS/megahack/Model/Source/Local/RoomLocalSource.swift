//
//  RoomLocalSource.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import Foundation

class RoomLocalSource: LocalSource {
    
    private var rooms: [Room] = []
    
    init() {
        add(item: Room(id: 1, type: .twilio, url: "",
                       description: "Converse com nosso palestrante",
                       imageName: "Room1"))
        add(item: Room(id: 1, type: .twilio, url: "",
                       description: "Saiba mais sobre a PEGN",
                       imageName: "Room2"))
        add(item: Room(id: 1, type: .twilio, url: "",
                       description: "Tire suas dúvidas!",
                       imageName: "Room3"))
    }
    
    func getAll() -> [Room] {
        return rooms
    }
    
    func add(item: Room) {
        rooms.append(item)
    }
}
