//
//  ViewController.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import UIKit
import SwiftUI
import Combine

class MovieViewController: UIViewController {
    private let viewModel = MovieViewModel(service: .init(networkProvider: .init()))
    private var cancellables = Set<AnyCancellable>()
    private let user: User
    
    lazy var movieUIHostingController: UIHostingController = {
        let hostingController = UIHostingController(rootView: MovieView(viewModel: viewModel))
        hostingController.view.backgroundColor = .systemBackground
        hostingController.view.overrideUserInterfaceStyle = .light
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        return hostingController
    }()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addChild(movieUIHostingController)
        view.addSubview(movieUIHostingController.view)
        setupConstraints()
        sendToDetailMovie()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "star.fill"),
            style: .plain,
            target: self,
            action: #selector(sendToFavoritsVC))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieUIHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            movieUIHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieUIHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieUIHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func sendToDetailMovie() {
        viewModel
            .movieDetailSubject
            .sink { movie in
                self.navigationController?.pushViewController(
                    DetailMovieViewController(movie: movie, user: self.user),
                    animated: true)
            }
            .store(in: &cancellables)
    }
    
    @objc private func sendToFavoritsVC() {
        self.navigationController?.pushViewController(FavoritsViewController(), animated: true)
    }
    
    
    
    
    

}

