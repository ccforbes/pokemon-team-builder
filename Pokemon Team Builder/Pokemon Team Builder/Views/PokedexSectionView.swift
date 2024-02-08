//
//  PokedexSectionView.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class PokedexSectionView: UIView {
    
    // MARK: - Properties
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    private let title: String
    private let value: String
    
    // MARK: - Initializers
    
    init(title: String, value: String, backgroundColor: UIColor) {
        self.title = title
        self.value = value
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        label.text = "\(title): \(value)"
        if (title == "Entry") {
            label.text = value
        }
        containerStackView.addArrangedSubview(label)
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
