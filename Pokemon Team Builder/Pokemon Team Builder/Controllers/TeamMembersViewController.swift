//
//  TeamMembersViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class TeamMembersViewController: UIViewController {
    
    // MARK: - Properties
    private let teamMembersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Members"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var teamMembersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width / 2.3, height: view.frame.height / 12)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Background Color")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TeamMembersCollectionViewCell.self, forCellWithReuseIdentifier: TeamMembersCollectionViewCell.id)
        return collectionView
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupTeamMembersLabel()
        setupTeamMembersCollectionView()
    }
    
    private func setupTeamMembersLabel() {
        view.addSubview(teamMembersLabel)
        NSLayoutConstraint.activate([
            teamMembersLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            teamMembersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
        ])
    }
    
    private func setupTeamMembersCollectionView() {
        view.addSubview(teamMembersCollectionView)
        NSLayoutConstraint.activate([
            teamMembersCollectionView.topAnchor.constraint(equalTo: teamMembersLabel.bottomAnchor, constant: 10),
            teamMembersCollectionView.leadingAnchor.constraint(equalTo: teamMembersLabel.leadingAnchor),
            teamMembersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            teamMembersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

// MARK: - DataSource Extension

extension TeamMembersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamMembersCollectionViewCell.id, for: indexPath) as?
                TeamMembersCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}

// MARK: - Delegate Extension

extension TeamMembersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(PokemonViewController(), animated: true)
    }
}
