//
//  BalanceViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 21/08/23.
//

import UIKit

class BalanceView: UIView {
    
    let titleLabel = UILabel()
    let balanceLabel = UILabel()
    var buttonPlus: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BalanceView: ViewCodeProtocol {
    func buildViewHierarchy() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(balanceLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 3)
        ])
        
        NSLayoutConstraint.activate([
            balanceLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            balanceLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: balanceLabel.bottomAnchor, multiplier: 3)
        ])
    }
    
    func configureViews() {
        backgroundColor = UIColor(red: 0.07, green: 0.08, blue: 0.09, alpha: 1.00)
        balanceLabel.text = "$254,352"
        balanceLabel.font = UIFont(name: "Poppins-SemiBold", size: 30)
        titleLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        layer.cornerRadius = 16
        titleLabel.text = "Total Balance"
    }
    
    
}
