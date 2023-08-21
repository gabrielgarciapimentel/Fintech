//
//  TransactionViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class TransactionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}


// MARK: - View Code implementation
extension TransactionViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
      // TO DO
    }
    
    func setupConstraints() {
      // TO DO
    }
    
    func configureViews() {
        view.backgroundColor = .systemBlue
    }
}
