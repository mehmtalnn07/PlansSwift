//
//  LoginViewModel.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Epostanızı ve parolanızı giriniz!!!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir e-post giriniz"
            return false
        }
        return true
    }
}
