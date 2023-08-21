//
//  TabbarController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class TabbarController: UITabBarController {
    var tabBarView: TabbarView!
}


// MARK: TabBar setter
extension TabbarController {
    func setTabBar(items: [TabbarItem]) {
        guard items.count > 0 else { return }
        
        tabBarView = TabbarView(items: items)
        guard let bar = tabBarView else { return }
        bar.tabBarItems.first?.setSelected(index: selectedIndex)
        
        bar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bar)
        bar.tabBarItems[2].setMoreItem()
        bar.tabBarItems[0].setSelected(index: 0)

        for i in 0 ..< items.count {
            items[i].tag = i
            items[i].addTarget(self, action: #selector(switchTab), for: .primaryActionTriggered)
        }
        
        NSLayoutConstraint.activate([
            bar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: bar.trailingAnchor, multiplier: 2),
            bar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    @objc func switchTab(button: UIButton) {
        selectedIndex = button.tag
        tabBarView.tabBarItems[0].setSelected(index: button.tag)
        tabBarView.tabBarItems[1].setSelected(index: button.tag)
        tabBarView.tabBarItems[3].setSelected(index: button.tag)
        tabBarView.tabBarItems[4].setSelected(index: button.tag)
    }
}
