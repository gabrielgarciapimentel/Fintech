//
//  StockCardView.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 22/08/23.
//

import UIKit

class StockCardView: UIView {
    let textLabel = UILabel()
    let image = UIImageView()
    
    
    init(textLabel: String, image: String, color: UIColor) {
        self.textLabel.text = textLabel
        self.image.image = UIImage(named: image)
        
        super.init(frame: .zero)
        
        self.backgroundColor = color
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StockCardView: ViewCodeProtocol {
    func buildViewHierarchy() {
        image.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textLabel)
        addSubview(image)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            image.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 1),
            image.widthAnchor.constraint(equalToConstant: 64),
            image.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: image.bottomAnchor, multiplier: 1),
            textLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: textLabel.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: textLabel.bottomAnchor, multiplier: 2)
        ])
    }
    
    func configureViews() {
        image.contentMode = .scaleAspectFit

        textLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        textLabel.textAlignment = .center
        
        layer.cornerRadius = 12
    }
}
