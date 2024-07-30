//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Ensi Khosravi on 24.10.2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButtton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButtton)
        addSubview(downloadButton)
        applyConstraint()
    }
    
    private func applyConstraint() {
        
        let playButtonConstraint = [
//            playButtton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButtton.widthAnchor.constraint(equalToConstant: 90),
            playButtton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            playButtton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
        ]
        
        let downloadButtonConstraint = [
//            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.widthAnchor.constraint(equalToConstant: 90),
            downloadButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
        ]
        
        NSLayoutConstraint.activate(playButtonConstraint)
        NSLayoutConstraint.activate(downloadButtonConstraint)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        heroImageView.sd_setImage(with: url, completed: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
