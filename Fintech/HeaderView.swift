//
//  HeaderView.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 21/08/23.
//

import UIKit

class HeaderView: UIView {
    let imageIcon = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let giftIcon = UIButton()
    let notificationIcon = UIButton()
    
    let balanceView = BalanceView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView: ViewCodeProtocol {
    func buildViewHierarchy() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(balanceView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: subTitleLabel.trailingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 2),
            balanceView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceView.trailingAnchor, multiplier: 2),
            balanceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30)
        ])
    }
    
    func configureViews() {
        backgroundColor = UIColor(red: 0.72, green: 0.71, blue: 0.97, alpha: 1.00)
        layer.cornerRadius = 16
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        titleLabel.text = "Welcome back!"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subTitleLabel.text = "Gabriel Garcia"
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}
