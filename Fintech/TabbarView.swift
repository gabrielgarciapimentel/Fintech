//
//  UITabBarView.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class TabbarView: UITabBar {
    var tabBarItems = [TabbarItem]()
    let totalWidth = UIScreen.main.bounds.width

    convenience init(items: [TabbarItem]) {
        self.init()
        tabBarItems = items
        applyViewCode()
    }
}

// MARK: - View Code implementation
extension TabbarView: ViewCodeProtocol {
    func buildViewHierarchy() {
        if tabBarItems.count == 0 { return }
        
        for i in 0 ..< tabBarItems.count {
            let item = tabBarItems[i]
            item.translatesAutoresizingMaskIntoConstraints = false
            addSubview(item)
        }
    }
    
    func setupConstraints() {
        if tabBarItems.count == 0 { return }
        
        let totalItemsWidth: CGFloat = (50 * CGFloat(tabBarItems.count))
        let sizeConstant: CGFloat = (totalWidth - totalItemsWidth - 20) / CGFloat(tabBarItems.count - 1)
        
        for i in 0 ..< tabBarItems.count {
            let item = tabBarItems[i]
            
            if i == 0 {
                NSLayoutConstraint.activate([
                    item.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                    item.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    item.widthAnchor.constraint(equalToConstant: 50),
                    item.heightAnchor.constraint(equalToConstant: 50),
                    bottomAnchor.constraint(equalToSystemSpacingBelow: item.bottomAnchor, multiplier: 0),
                ])
            } else if i == tabBarItems.count - 1 {
                NSLayoutConstraint.activate([
                    item.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    item.widthAnchor.constraint(equalToConstant: 50),
                    item.heightAnchor.constraint(equalToConstant: 50),
                    bottomAnchor.constraint(equalToSystemSpacingBelow: item.bottomAnchor, multiplier: 0),
                    item.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
                ])
            } else {
                NSLayoutConstraint.activate([
                    item.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    item.widthAnchor.constraint(equalToConstant: 50),
                    item.heightAnchor.constraint(equalToConstant: 50),
                    bottomAnchor.constraint(equalToSystemSpacingBelow: item.bottomAnchor, multiplier: 0),
                    item.leadingAnchor.constraint(equalTo: tabBarItems[i - 1].trailingAnchor, constant: sizeConstant)
                ])
            }
        }
    }
    
    func configureViews() {
        barTintColor = .systemBackground
    }
}
