//
//  FavoritsViewController.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import UIKit
import SwiftUI

class FavoritsViewController: UIViewController {
    
    lazy var favoriteUIHostingController: UIHostingController = {
        let hostingController = UIHostingController(rootView: FavoritsView(favorits: userFavorits()))
        hostingController.view.backgroundColor = .systemBackground
        hostingController.view.overrideUserInterfaceStyle = .light
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        return hostingController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(favoriteUIHostingController)
        view.addSubview(favoriteUIHostingController.view)
        
        setupConstraints()
        
    }
    
    private func userFavorits() -> [MovieSearches] {
        let emptyMovies: [MovieSearches] = []
        return emptyMovies
        if let encodedData = UserDefaults.standard.data(forKey: "userFavorits") {
            let decoder = JSONDecoder()
            if let decodedUserFavorits = try? decoder.decode([MovieSearches].self, from: encodedData) {
                return decodedUserFavorits
            }
        } else {
            return emptyMovies
        }
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            favoriteUIHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            favoriteUIHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            favoriteUIHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteUIHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    

}
