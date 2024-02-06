//
//  TeamsCollectionViewCell.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 1/21/24.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "TeamsCollectionViewCell"
    
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
    
    let teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Legends Arceus Team"
        label.textColor = .white
        return label
    }()
    
    lazy var teamPreviewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: contentView.frame.size.width / 13, height: contentView.frame.size.height / 5)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Background Color")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(PokemonTeamCollectionViewCell.self, forCellWithReuseIdentifier: PokemonTeamCollectionViewCell.id)
        return collectionView
    }()
    
    // MARK: - Initializers and Overriden Stubs

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI Components
    
    private func setupUI() {
        setupContainerView()
        setupGameVersionLogoImageView()
        setupTeamNameLabel()
        setupPokemonTeamCollectionView()
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
            gameVersionLogoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            gameVersionLogoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        ])
    }
    
    private func setupTeamNameLabel() {
        containerView.addSubview(teamNameLabel)
        NSLayoutConstraint.activate([
            teamNameLabel.topAnchor.constraint(equalTo: gameVersionLogoImageView.topAnchor),
            teamNameLabel.leadingAnchor.constraint(equalTo: gameVersionLogoImageView.trailingAnchor, constant: 10),
        ])
    }
    
    private func setupPokemonTeamCollectionView() {
        containerView.addSubview(teamPreviewCollectionView)
        NSLayoutConstraint.activate([
            teamPreviewCollectionView.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 4),
            teamPreviewCollectionView.leadingAnchor.constraint(equalTo: teamNameLabel.leadingAnchor),
            teamPreviewCollectionView.bottomAnchor.constraint(equalTo: gameVersionLogoImageView.bottomAnchor),
            teamPreviewCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
    }

}

// MARK: - DataSource Extension

extension TeamsCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonTeamCollectionViewCell.id, for: indexPath)
                as? PokemonTeamCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
