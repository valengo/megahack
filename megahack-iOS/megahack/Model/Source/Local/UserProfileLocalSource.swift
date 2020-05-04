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
        
        add(item: UserProfile(id: 6, name: "Pina", field: "Networking",
                              social: SocialMedia(id: 1, type: .Whatsapp,
                              url: "whatsapp://send?phone=+14155238886&text=join%20cut-consider"),
                              imageName: "Pina"))
        
        
        add(item: UserProfile(id: 1, name: "Andressa Valengo", field: "Developer",
                              social: SocialMedia(id: 1, type: .GitHub,
                              url: "https://github.com/valengo"),
                              imageName: "Andy"))
        
        add(item: UserProfile(id: 1, name: "Eduarda Linhares Mello", field: "Marketing",
                              social: SocialMedia(id: 1, type: .Linkedin, url: "https://www.linkedin.com/in/eduarda-linhares-mello/"),
                              imageName: "Duda"))
        
        add(item: UserProfile(id: 3, name: "Jéssica Matsuura", field: "Designer",
                              social: SocialMedia(id: 1, type: .Linkedin, url: "https://www.linkedin.com/in/jessicamatsu/"),
                              imageName: "Jess"))
        
        add(item: UserProfile(id: 4, name: "Kevin Katzer", field: "Developer",
                              social: SocialMedia(id: 1, type: .Linkedin, url: "https://www.linkedin.com/in/kevin-katzer/"),
                              imageName: "Kevin"))
        
        add(item: UserProfile(id: 5, name: "Vinícius Binder", field: "Business",
                              social: SocialMedia(id: 1, type: .Linkedin, url: "https://www.linkedin.com/in/vin%C3%ADcius-binder-854773189/"),
                              imageName: "Vini"))
        
    }
    
    func getAll() -> [UserProfile] {
        return profiles
    }
    
    func add(item: UserProfile) {
        profiles.append(item)
    }
}
