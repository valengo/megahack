//
//  NotificationLocalSource.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

class NotificationLocalSource: LocalSource {
        
    var notifications: [EventNotification] = []
    
    init() {
        
        add(item:EventNotification(id: 1, imageName: "Not1", description: "Palestrante disponível para conversas!", time: "2h", group: "Hoje"))
        
        add(item:EventNotification(id: 2, imageName: "Not2", description: "Sorteio aberto!", time: "12h", group: "Ontem"))
        add(item:EventNotification(id: 3, imageName: "Not3", description: "Live agora!", time: "15h", group: "Ontem"))
        add(item:EventNotification(id: 4, imageName: "Not4", description: "Sorteio agora!", time: "17h", group: "Ontem"))
        
        add(item:EventNotification(id: 5, imageName: "Not5", description: "Sorteio agora!", time: "17h", group: "Na semana"))
        add(item:EventNotification(id: 7, imageName: "Not4", description: "Bora conhecer a Twilio!", time: "1d", group: "Na semana"))
        add(item:EventNotification(id: 6, imageName: "Not2", description: "Desafio PEGN e Época Negócios!", time: "2d", group: "Na semana"))
        add(item:EventNotification(id: 8, imageName: "Not3", description: "Abertura do Meghack começou!", time: "2d", group: "Na semana"))
    }
    
    func getAll() -> [EventNotification] {
        return notifications
    }
    
    func add(item: EventNotification) {
        notifications.append(item)
    }
}
