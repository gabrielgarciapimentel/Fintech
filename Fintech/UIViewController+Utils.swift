//
//  UIViewController+Utils.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
        navBarAppearance.backgroundColor = .systemBlue
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let image = UIImage(named: imageName)
        tabBarItem = UITabBarItem(title: "", image: image, tag: 0)
    }
}
