//
//  TeamMembersCollectionViewCell.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/4/24.
//

import UIKit

class TeamMembersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "TeamMembersCollectionViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.backgroundColor = UIColor(named: "Background Color")
        view.layer.borderColor = UIColor(named: "Stroke")?.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 20
        return view
    }()
    
    let teamMemberNicknameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pikachu"
        label.textColor = .white
        return label
    }()
    
    lazy var teamMemberImageView: UIImageView = {
        let image = UIImage(named: "Pikachu")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(50, 50))
        let imageView = UIImageView(image: resizedImage!)
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
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupContainerView()
        setupTeamMemberImageView()
        setupTeamMemberNicknameLabel()
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupTeamMemberImageView() {
        containerView.addSubview(teamMemberImageView)
        NSLayoutConstraint.activate([
            teamMemberImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            teamMemberImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupTeamMemberNicknameLabel() {
        containerView.addSubview(teamMemberNicknameLabel)
        NSLayoutConstraint.activate([
            teamMemberNicknameLabel.leadingAnchor.constraint(equalTo: teamMemberImageView.trailingAnchor, constant: 10),
            teamMemberNicknameLabel.centerYAnchor.constraint(equalTo: teamMemberImageView.centerYAnchor)
        ])
    }
}
