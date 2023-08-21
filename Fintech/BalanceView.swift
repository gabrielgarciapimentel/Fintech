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
    var buttonPlus = UIButton()
    var blurredView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makePlusButton() -> UIButton {
        let button = UIButton()
        let imageMore = UIImage(named: "more.icon")
        button.setImage(imageMore, for: .normal)
        button.layer.cornerRadius = 24
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.30, green: 0.29, blue: 0.94, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.glowEffect(withColor: UIColor(red: 0.30, green: 0.29, blue: 0.94, alpha: 1.00), withEffect: .big)
        
        return button
    }
}

// MARK: - View Code implementation
extension BalanceView: ViewCodeProtocol {
    func buildViewHierarchy() {
        blurredView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus = makePlusButton()
        
        addSubview(blurredView)
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(buttonPlus)
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
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: buttonPlus.trailingAnchor, multiplier: 2),
            buttonPlus.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonPlus.widthAnchor.constraint(equalToConstant: 48),
            buttonPlus.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            blurredView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurredView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurredView.topAnchor.constraint(equalTo: topAnchor),
            blurredView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureViews() {
        balanceLabel.text = "$254,352"
        balanceLabel.font = UIFont(name: "Poppins-SemiBold", size: 30)
        titleLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        titleLabel.text = "Total Balance"
        
        //MARK: Blur image
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurredView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 16
        blurredView.layer.cornerRadius = 16
        blurEffectView.clipsToBounds = true
        self.blurredView.addSubview(blurEffectView)
        
        blurredView.backgroundColor = UIColor(red: 0.07, green: 0.08, blue: 0.09, alpha: 0.5)
    }
}
