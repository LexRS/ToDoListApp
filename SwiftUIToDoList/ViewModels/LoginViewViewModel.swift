//
//  LoginViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by Алексей Поддубный on 18.05.2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
