//
//  PokemonTeamCollectionViewCell.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 1/29/24.
//

import UIKit

class PokemonTeamCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let id = "PokemonTeamCollectionViewCell"
    
    lazy var teamMemberImageView: UIImageView = {
        let image = UIImage(named: "Pikachu")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(50, 50))
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "Background Color")
        contentView.addSubview(teamMemberImageView)
        NSLayoutConstraint.activate([
            teamMemberImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            teamMemberImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            teamMemberImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            teamMemberImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
