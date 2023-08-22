//
//  HomeViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let headerView = HeaderView()
    let horizontalStocks = UIStackView()
    var stocks: [StockCardView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}


// MARK: - View Code implementation
extension HomeViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        horizontalStocks.translatesAutoresizingMaskIntoConstraints = false
        
        stocks.append(StockCardView(textLabel: "Stock", image: "box.image", color: UIColor(red: 1.00, green: 0.58, blue: 0.34, alpha: 1.00)))
        stocks.append(StockCardView(textLabel: "Stock", image: "safe.image", color: UIColor(red: 0.74, green: 0.74, blue: 1.00, alpha: 1.00)))
        stocks.append(StockCardView(textLabel: "Stock", image: "pig.image", color: UIColor(red: 1.00, green: 0.58, blue: 0.34, alpha: 1.00)))
        
        stocks.forEach {
            view in
            horizontalStocks.addArrangedSubview(view)
        }
        view.addSubview(horizontalStocks)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            horizontalStocks.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 5),
            horizontalStocks.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: horizontalStocks.trailingAnchor, multiplier: 2)
        ])
    }
    
    func configureViews() {
        view.backgroundColor = .systemRed
        horizontalStocks.axis = .horizontal
        horizontalStocks.distribution = .fillEqually
        horizontalStocks.spacing = 8
    }
}
