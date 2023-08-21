//
//  TabbarViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 20/08/23.
//

import UIKit

class TabbarViewController: TabbarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}

// MARK: - View Code implementation
extension TabbarViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        let homeTab = TabbarItem(icon: UIImage(named: "home.icon") ?? UIImage(systemName: "")!, index: 0)
        let transactionTab = TabbarItem(icon: UIImage(named: "transaction.icon") ?? UIImage(systemName: "")!, index: 1)
        let imageMore = UIImage(named: "more.icon")?.withAlignmentRectInsets(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        let moreTab = TabbarItem(icon: imageMore ?? UIImage(systemName: "")!, index: 2)
        let withdrawTab = TabbarItem(icon: UIImage(named: "withdraw.icon") ?? UIImage(systemName: "")!, index: 3)
        let walletTab = TabbarItem(icon: UIImage(named: "wallet.icon") ?? UIImage(systemName: "")!, index: 4)
        
        
        let homeVC = HomeViewController()
        let transactionVC = TransactionViewController()
        let moreVC = TransactionViewController()
        let withdrawVC = TransactionViewController()
        let walletTabVC = TransactionViewController()
        
        setTabBar(items: [homeTab, transactionTab, moreTab, withdrawTab, walletTab])
        viewControllers = [homeVC, transactionVC, moreVC, withdrawVC, walletTabVC]
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        
    }
    
}
