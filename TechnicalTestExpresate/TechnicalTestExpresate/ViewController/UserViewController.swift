//
//  UserViewController.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import UIKit
import SwiftUI
import Combine

class UserViewController: UIViewController {
    private let viewModel = UserViewModel(service: .init())
    private var cancellables = Set<AnyCancellable>()
    
    lazy var userUIHostingController: UIHostingController = {
        let hostingController = UIHostingController(rootView: SignInView(viewModel: viewModel))
        hostingController.view.backgroundColor = .systemBackground
        hostingController.view.overrideUserInterfaceStyle = .light
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        return hostingController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(userUIHostingController)
        view.addSubview(userUIHostingController.view)
        
        setupConstraints()
        sendToSearchMovies()
        viewModel.binding()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userUIHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            userUIHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            userUIHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userUIHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func sendToSearchMovies() {
        viewModel
            .userSubject
            .sink { user in
                self.navigationController?.pushViewController(MovieViewController(user: user), animated: true)
            }
            .store(in: &cancellables)
    }
    
    
    



}
