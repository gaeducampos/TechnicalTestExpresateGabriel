//
//  DetailMovieViewController.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import UIKit
import SwiftUI

class DetailMovieViewController: UIViewController {
    let movie: MovieSearches
    let user: User
    
    let viewModel: DetailMovieViewModel
    
    
    init(movie: MovieSearches, user: User) {
        self.movie = movie
        self.user = user
        self.viewModel = DetailMovieViewModel(user: self.user, movie: self.movie)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var detailMovieUIHostingController: UIHostingController = {
        let hostingController = UIHostingController(rootView: DetailMovieView(viewModel: viewModel))
        hostingController.view.backgroundColor = .systemBackground
        hostingController.view.overrideUserInterfaceStyle = .light
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        return hostingController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(detailMovieUIHostingController)
        view.addSubview(detailMovieUIHostingController.view)
        
        setupConstraints()
        

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailMovieUIHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            detailMovieUIHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailMovieUIHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailMovieUIHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
