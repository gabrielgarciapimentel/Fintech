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
    
    let rewardsVC = RewardViewController()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}


// MARK: - View Code implementation
extension HomeViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stocks.append(StockCardView(textLabel: "Stock", image: "box.image", color: UIColor(red: 1.00, green: 0.58, blue: 0.34, alpha: 1.00)))
        stocks.append(StockCardView(textLabel: "Stock", image: "safe.image", color: UIColor(red: 0.74, green: 0.74, blue: 1.00, alpha: 1.00)))
        stocks.append(StockCardView(textLabel: "Stock", image: "pig.image", color: UIColor(red: 1.00, green: 0.58, blue: 0.34, alpha: 1.00)))
        
        stocks.forEach {
            view in
            horizontalStocks.addArrangedSubview(view)
        }
        
        stackView.addArrangedSubview(horizontalStocks)
        stackView.addArrangedSubview(rewardsVC.view)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(headerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            scrollView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 0),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: scrollView.trailingAnchor, multiplier: 2),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 42),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureViews() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.00)
        horizontalStocks.axis = .horizontal
        horizontalStocks.distribution = .fillEqually
        horizontalStocks.spacing = 14
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
}
