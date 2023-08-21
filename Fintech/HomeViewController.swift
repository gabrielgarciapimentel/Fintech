//
//  HomeViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}


// MARK: - View Code implementation
extension HomeViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
    }
    
    func setupConstraints() {
    }
    
    func configureViews() {
        view.backgroundColor = .systemRed
    }
}
