//
//  MainScreenViewModel.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation
import SwiftUI

extension MainScreen {
    
    @MainActor class ViewModel: ObservableObject {
        var users: Users = Users()
        @Published var usersArray: [User]
        
        init() {
            usersArray = users.getUsers()

        }
        
        func propertyDidChange() {
            print("entre a propertyDidChange")
            loadUsers()
        }
        
        func deleteUser(_ user: User) {
            users.removeUser(user)
            loadUsers()
        }
        
        func loadUsers() {
            users = Users()
            usersArray = users.getUsers()
            print("Se cargo")
        }
        
        
    }
    
}
