//
//  HomeTableViewHeader.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 24/08/23.
//

import UIKit

class HomeHeaderTableView: UIView {
    let headerView = HeaderView()
    let horizontalStocks = UIStackView()
    var stocks: [StockCardView] = []
    
    let rewardsVC = RewardViewController()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Code implementation
extension HomeHeaderTableView: ViewCodeProtocol {
    func buildViewHierarchy() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStocks.translatesAutoresizingMaskIntoConstraints = false
        rewardsVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        stocks.append(StockCardView(textLabel: "Stock", image: "box.image", color: UIColor(red: 1.00, green: 0.58, blue: 0.34, alpha: 1.00)))
        stocks.append(StockCardView(textLabel: "Stock", image: "safe.image", color: UIColor(red: 0.74, green: 0.74, blue: 1.00, alpha: 1.00)))
        stocks.append(StockCardView(textLabel: "Stock", image: "pig.image", color: UIColor(red: 1.00, green: 0.58, blue: 0.34, alpha: 1.00)))
        
        stocks.forEach {
            view in
            horizontalStocks.addArrangedSubview(view)
        }
        
        addSubview(horizontalStocks)
        addSubview(rewardsVC.view)
        addSubview(headerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
        ])
        
         
        NSLayoutConstraint.activate([
            horizontalStocks.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            horizontalStocks.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 42),
            horizontalStocks.widthAnchor.constraint(equalTo: widthAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            rewardsVC.view.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            rewardsVC.view.topAnchor.constraint(equalToSystemSpacingBelow: horizontalStocks.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsVC.view.trailingAnchor, multiplier: 2),
            rewardsVC.view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configureViews() {
        backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.00)
        horizontalStocks.axis = .horizontal
        horizontalStocks.distribution = .fillEqually
        horizontalStocks.spacing = 14
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
}
