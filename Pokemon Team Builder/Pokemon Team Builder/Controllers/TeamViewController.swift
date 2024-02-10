//
//  TeamViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/3/24.
//

import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - Properties
    
    private let teamInfoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teamMembersContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let teamMembersLabel: UILabel = {
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
        collectionView.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: PreviewCollectionViewCell.id)
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
        setupTeamInfoSection()
        setupTeamMemberSection()
    }
    
    private func setupTeamInfoSection() {
        view.addSubview(teamInfoContainerView)
        NSLayoutConstraint.activate([
            teamInfoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            teamInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teamInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teamInfoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
        let teamInfoViewController = TeamInfoViewController()
        addChild(teamInfoViewController)
        teamInfoContainerView.addSubview(teamInfoViewController.view)
        teamInfoViewController.didMove(toParent: self)
        teamInfoViewController.view.frame = teamInfoContainerView.frame
    }
    
    private func setupTeamMemberSection() {
        view.addSubview(teamMembersContainerView)
        NSLayoutConstraint.activate([
            teamMembersContainerView.topAnchor.constraint(equalTo: teamInfoContainerView.bottomAnchor, constant: 15),
            teamMembersContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teamMembersContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teamMembersContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        let teamMembersViewController = TeamMembersViewController()
        addChild(teamMembersViewController)
        teamMembersContainerView.addSubview(teamMembersViewController.view)
        teamMembersViewController.didMove(toParent: self)
        teamMembersViewController.view.frame = teamMembersContainerView.frame
    }

}

// MARK: - DataSource Extension

extension TeamViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCollectionViewCell.id, for: indexPath) as?
                PreviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}

extension TeamViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = UIColor.lightGray
        }
    }
}
