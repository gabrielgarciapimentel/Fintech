//
//  RewardViewController.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 22/08/23.
//

import UIKit

class RewardViewController: UIViewController {
    let titleLabel = UILabel()
    let image = UIImageView()
    var rewardItems: [RewardItemView] = []
    
    let container = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyViewCode()
    }
}

extension RewardViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        rewardItems.append(RewardItemView(icon: "ticket.icon", title: "Step 1", text: "Enter introduce couper"))
        rewardItems.append(RewardItemView(icon: "invest.icon", title: "Step 2", text: "Deposit in fund"))
        
        for (_,view) in rewardItems.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(view)
        }
        
        view.addSubview(titleLabel)
        container.addSubview(image)
        view.addSubview(container)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
        ])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            container.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: container.trailingAnchor, multiplier: 0),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            container.trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 2),
        ])
        
        for (index,item) in rewardItems.enumerated() {
            if index == 0 {
                NSLayoutConstraint.activate([
                    item.topAnchor.constraint(equalToSystemSpacingBelow: container.topAnchor, multiplier: 2),
                    item.leadingAnchor.constraint(equalToSystemSpacingAfter: container.leadingAnchor, multiplier: 2)
                ])
            } else if index == rewardItems.count - 1 {
                NSLayoutConstraint.activate([
                    item.topAnchor.constraint(equalToSystemSpacingBelow: rewardItems[index - 1].bottomAnchor, multiplier: 3.5),
                    item.leadingAnchor.constraint(equalToSystemSpacingAfter: container.leadingAnchor, multiplier: 2),
                    container.bottomAnchor.constraint(equalToSystemSpacingBelow: item.bottomAnchor, multiplier: 2)
                ])
            } else {
                NSLayoutConstraint.activate([
                    item.topAnchor.constraint(equalToSystemSpacingBelow: rewardItems[index - 1].bottomAnchor, multiplier: 3.5),
                    item.leadingAnchor.constraint(equalToSystemSpacingAfter: container.leadingAnchor, multiplier: 2)
                ])
            }
        }
    }
    
    func configureViews() {
        container.layer.cornerRadius = 16
        container.backgroundColor = UIColor(red: 0.10, green: 0.11, blue: 0.12, alpha: 1.00)
        
        titleLabel.text = "Reward"
        titleLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        
        image.image = UIImage(named: "coins.image")
    }
    
    
}
