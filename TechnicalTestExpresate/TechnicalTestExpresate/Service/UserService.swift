//
//  UserService.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation

struct UserService {
    let userValid = User(id: UUID(),
                         email: "yo@expresate.com",
                         password: "nwpw023*",
                         userFavorits: [MovieSearches]())
    
    
    func userSingIn(email: String, password: String) -> Bool {
        return email == userValid.email && password == userValid.password
    }
}


