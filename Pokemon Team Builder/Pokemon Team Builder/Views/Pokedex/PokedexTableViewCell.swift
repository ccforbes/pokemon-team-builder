//
//  PokedexTableViewCell.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/22/24.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let id = "PokedexTableViewCell"
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let pokemonImageView: UIImageView = {
        let image = UIImage(named: "Pikachu")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(80, 80))
        let imageView = UIImageView(image: resizedImage!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pokemonNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = ["025", "150"].randomElement()
        label.textColor = .white
        return label
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = ["Pikachu", "Mewtwo"].randomElement()
        label.textColor = .white
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        backgroundColor = .clear
        contentStackView.addArrangedSubview(pokemonImageView)
        contentStackView.addArrangedSubview(pokemonNumberLabel)
        contentStackView.addArrangedSubview(pokemonNameLabel)
        contentView.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
        
    }

}
