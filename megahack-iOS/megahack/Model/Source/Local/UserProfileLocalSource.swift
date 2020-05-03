//
//  UserProfileLocalSource.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

class UserProfileLocalSource: LocalSource {

    var profiles: [UserProfile] = []
    
    
    init() {
        add(item: UserProfile(id: 1, name: "Andressa Valengo", field: "Developer",
                              social: SocialMedia(id: 1, type: .linkedin, url: "https://www.linkedin.com/in/valengo/"),
                              imageName: "Andy"))
        
        add(item: UserProfile(id: 1, name: "Eduarda Linhares Mello", field: "Marketing",
                              social: SocialMedia(id: 1, type: .linkedin, url: "https://www.linkedin.com/in/eduarda-linhares-mello/"),
                              imageName: "Duda"))
        
        add(item: UserProfile(id: 3, name: "Jéssica Matsuura", field: "Designer",
                              social: SocialMedia(id: 1, type: .linkedin, url: "https://www.linkedin.com/in/jessicamatsu/"),
                              imageName: "Jess"))
        
        add(item: UserProfile(id: 1, name: "Kevin Katzer", field: "Developer",
                              social: SocialMedia(id: 1, type: .linkedin, url: "https://www.linkedin.com/in/kevin-katzer/"),
                              imageName: "Kevin"))
        
        add(item: UserProfile(id: 1, name: "Vinícius Binder", field: "Business",
                              social: SocialMedia(id: 1, type: .linkedin, url: "https://www.linkedin.com/in/vin%C3%ADcius-binder-854773189/"),
                              imageName: "Vini"))
        
    }
    
    func getAll() -> [UserProfile] {
        return profiles
    }
    
    func add(item: UserProfile) {
        profiles.append(item)
    }
}
