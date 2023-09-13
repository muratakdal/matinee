//
//  HeroHeaderUIView.swift
//  Matinee
//
//  Created by Murat Akdal on 9.08.2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let filmNameLabel: UILabel = {
        let label = UILabel()
        label.text = "OPPENHEIMER"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let filmDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("More", for: .normal)
        //        button.setTitleColor(UIColor(named: "matineePrimaryColor"), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        //        button.layer.borderColor = UIColor(named: "matineePrimaryColor")?.cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let trailerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Trailer", for: .normal)
        //        button.setTitleColor(UIColor(named: "matineePrimaryColor"), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        //        button.layer.borderColor = UIColor(named: "matineePrimaryColor")?.cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "oppenheimer")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(filmNameLabel)
        addSubview(trailerButton)
        addSubview(filmDetailButton)
        applyConstraints()
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor(named: "matineePrimaryColor")?.cgColor as Any
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraints() {
        let trailerButtonConstraints = [
            trailerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            trailerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            trailerButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let filmDetailButtonConstraints = [
            filmDetailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            filmDetailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            filmDetailButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let filmNameLabelConstraints = [
            filmNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),
            filmNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            filmNameLabel.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        NSLayoutConstraint.activate(trailerButtonConstraints)
        NSLayoutConstraint.activate(filmDetailButtonConstraints)
        NSLayoutConstraint.activate(filmNameLabelConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
