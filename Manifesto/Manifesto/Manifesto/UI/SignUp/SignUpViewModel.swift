//
//  SignUpViewModel.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation

extension SignUp {
    
    @MainActor class ViewModel: ObservableObject {
        var users: Users = Users()
        
        init() { }
        
        func signUser(name: String, phoneNumber: String, email: String, emergencyNumber: String, emergencyContactName: String) {
            print(name)
            let newUser = User(name: name, phoneNumber: phoneNumber, email: email, emergencyNumber: emergencyNumber, emergencyContactName: emergencyContactName)
            
            users.addUser(newUser)
        }
    }
}
