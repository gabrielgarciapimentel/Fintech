//
//  RewardItemView.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 22/08/23.
//

import UIKit

class RewardItemView: UIView {
    let icon = UIImageView()
    let titleLabel = UILabel()
    let textLabel = UILabel()
    let iconContainer = UIView()
    
    init(icon: String, title: String, text: String) {
        self.icon.image = UIImage(named: icon)
        self.titleLabel.text = title
        self.textLabel.text = text
        
        super.init(frame: .zero)
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RewardItemView: ViewCodeProtocol {
    func buildViewHierarchy() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        
        iconContainer.addSubview(icon)
        addSubview(iconContainer)
        addSubview(titleLabel)
        addSubview(textLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconContainer.topAnchor.constraint(equalTo: topAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 32),
            iconContainer.heightAnchor.constraint(equalToConstant: 32),
        ])
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 20),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: iconContainer.trailingAnchor, multiplier: 1),
            titleLabel.topAnchor.constraint(equalTo: iconContainer.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 0),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureViews() {
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        textLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        textLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.00)
        
        icon.tintColor = UIColor(red: 0.11, green: 0.10, blue: 0.33, alpha: 1.00)
        icon.contentMode = .scaleAspectFit
        
        iconContainer.layer.cornerRadius = 16
        iconContainer.backgroundColor = UIColor(red: 0.78, green: 0.78, blue: 0.98, alpha: 1.00)
    }
}
