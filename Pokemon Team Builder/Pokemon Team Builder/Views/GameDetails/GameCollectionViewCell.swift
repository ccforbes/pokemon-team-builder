//
//  GameCollectionViewCell.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/26/24.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "GameCollectionViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Background Color")
        view.layer.borderColor = UIColor(named: "Stroke")?.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var gameVersionLogoImageView: UIImageView = {
        let image = UIImage(named: "Legends Arceus Logo")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(80, 80))
        let imageView = UIImageView(image: resizedImage!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupContainerView()
        setupGameVersionLogoImageView()
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setupGameVersionLogoImageView() {
        containerView.addSubview(gameVersionLogoImageView)
        NSLayoutConstraint.activate([
            gameVersionLogoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            gameVersionLogoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            gameVersionLogoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            gameVersionLogoImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
}
