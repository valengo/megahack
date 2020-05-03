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
        
    }
    
    func getAll() -> [UserProfile] {
        return profiles
    }
    
    func add(item: UserProfile) {
        profiles.append(item)
    }
}
