//
//  HomeViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let headerView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}


// MARK: - View Code implementation
extension HomeViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        view.addSubview(headerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    func configureViews() {
        view.backgroundColor = .systemRed
    }
}
