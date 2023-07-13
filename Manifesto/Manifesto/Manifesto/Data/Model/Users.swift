//
//  Users.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation

class Users: ObservableObject {
    @Published var usersArray: [User]
    let saveKey = "Users"
    
    init() {
        // load usersArray from UserDefaults
        usersArray = []
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                usersArray = decoded
            }
        }
    }
    
    func addUser(_ newUser: User) {
        // add new user to usersArray
        usersArray.append(newUser)
        save()
    }
    
    func getUsers() -> [User] {
        return usersArray
    }
    
    func removeUser(_ user: User) {
        // remove user
        usersArray.removeAll { $0 == user }
        save()
    }
    
    func save() {
        // save changes in usersArray
        if let encoded = try? JSONEncoder().encode(usersArray) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
        print(usersArray)
    }
}
