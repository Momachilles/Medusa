//
//  MainViewController.swift
//  MedusaExample
//
//  Created by David Alarcon on 11/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

import UIKit
import Medusa

class MainViewController: UIViewController {
    
    let networkManager: NetworkManager
    
    //MARK: - Init
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        loadMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - Load data
    
    fileprivate func loadMovies() {
        networkManager.movies(page: 1) { (movies, error) in
            if let error = error {
                print(error)
            }
            
            if let movies = movies {
                print(movies)
            }
        }
    }
}

