//
//  TabbarItem.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class TabbarItem: UIButton {
    
    let icon = UIImageView()
    let dot = UIView()
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    convenience init(icon: UIImage, index: Int) {
        self.init()
        
        self.icon.image = icon
        self.index = index
        self.icon.tintColor = UIColor(red: 0.60, green: 0.64, blue: 0.70, alpha: 1.00)
        dot.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Code implementation
extension TabbarItem: ViewCodeProtocol {
    func buildViewHierarchy() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        dot.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(icon)
        addSubview(dot)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            dot.topAnchor.constraint(equalToSystemSpacingBelow: icon.bottomAnchor, multiplier: 1),
            dot.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            dot.widthAnchor.constraint(equalToConstant: 6),
            dot.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
    
    func configureViews() {
        dot.layer.cornerRadius = 3
        icon.contentMode = .scaleAspectFit
    }
}

// MARK: - Item actions
extension TabbarItem {
    func setSelected(index: Int) {
        if index == self.index {
            self.dot.alpha = 1
            self.dot.backgroundColor = UIColor(red: 0.30, green: 0.29, blue: 0.94, alpha: 1.00)
            self.icon.tintColor = UIColor(red: 0.30, green: 0.29, blue: 0.94, alpha: 1.00)
        } else {
            self.dot.alpha = 0
            self.icon.tintColor = UIColor(red: 0.60, green: 0.64, blue: 0.70, alpha: 1.00)
        }
        
        self.layoutIfNeeded()
    }
    
    func setMoreItem() {
        self.dot.alpha = 0
        self.icon.tintColor = UIColor(red: 0.60, green: 0.64, blue: 0.70, alpha: 1.00)
        self.backgroundColor = UIColor(red: 0.30, green: 0.29, blue: 0.94, alpha: 1.00)
        self.icon.tintColor = .white
        self.layer.cornerRadius = 8
    }
}
