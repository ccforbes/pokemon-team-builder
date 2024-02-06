//
//  TeamViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/3/24.
//

import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - Properties
    
    let teamMembersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Team Members"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var teamMembersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width / 2.3, height: view.frame.height / 9)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Background Color")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(TeamMembersCollectionViewCell.self, forCellWithReuseIdentifier: TeamMembersCollectionViewCell.id)
        return collectionView
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background Color")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Team"
        setupUI()
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            teamMembersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamMembersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }
    
    private func setupTeamMembersCollectionView() {
        view.addSubview(teamMembersCollectionView)
        NSLayoutConstraint.activate([
            teamMembersCollectionView.topAnchor.constraint(equalTo: teamMembersLabel.bottomAnchor, constant: 10),
            teamMembersCollectionView.leadingAnchor.constraint(equalTo: teamMembersLabel.leadingAnchor),
            teamMembersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height / 2.4)),
            teamMembersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18)
        ])
    }

}

// MARK: - DataSource Extension

extension TeamViewController : UICollectionViewDataSource {
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
