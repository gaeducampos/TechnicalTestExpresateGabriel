//
//  UserViewModel.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    private let service: UserService
    let userSubject = PassthroughSubject<User, Never>()
    
    @Published var email = ""
    @Published var password = ""
    @Published var isButtonDisable = true
    
    private var cancellables =  Set<AnyCancellable>()
    
    init(service: UserService) {
        self.service = service
    }
    
    
    func userSingIn() {
        if service.userSingIn(email: email, password: password) {
            userSubject.send(User(id: UUID(),
                                  email: email,
                                  password: password,
                                  userFavorits: [MovieSearches]()))
        }
    }
    
    func binding() {
        combinePublishers
            .receive(on: RunLoop.main)
            .assign(to: \.isButtonDisable, on: self)
            .store(in: &cancellables)
            
    }
    
    
    /// Mark: Validations 
    private var emailPublisher: AnyPublisher<Bool, Never> {
        $email
            .dropFirst()
            .map { input in
                return input.isValidEmail() && input.count >= 4 && input == self.service.userValid.email
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordPublisher: AnyPublisher<Bool, Never> {
        $password
            .dropFirst()
            .map { input in
                return input.count >= 8
            }
            .eraseToAnyPublisher()
            
    }
    
    private var combinePublishers: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(emailPublisher, passwordPublisher)
            .map { email, password in
                return email && password
            }
            .map { !$0 }
            .eraseToAnyPublisher()
    }
}
