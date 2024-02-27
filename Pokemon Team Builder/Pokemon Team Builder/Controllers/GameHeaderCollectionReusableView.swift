//
//  GameHeaderCollectionReusableView.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/26/24.
//

import UIKit

class GameHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let id = "GameHeaderCollectionReusableView"
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
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
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(headerText: String) {
        headerLabel.text = headerText
    }
}
