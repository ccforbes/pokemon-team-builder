//
//  ViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 1/19/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    
    lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.appTitle
        label.font = viewModel.appTitleFont
        label.textColor = .white
        return label
    }()
    
    lazy var teamsLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.teamsLabelTitle
        label.font = viewModel.teamsLabelFont
        label.textColor = .white
        return label
    }()
    
    lazy var teamsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width / 1.15, height: view.frame.size.height / 7)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "Background Color")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: TeamsCollectionViewCell.id)
        return collectionView
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Initializers
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI Methods
    
    private func setupUI() {
        setupAppTitleLabel()
        setupTeamsTitleLabel()
        setupTeamsCollectionView()
    }
    
    private func setupAppTitleLabel() {
        view.addSubview(appTitleLabel)
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            appTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupTeamsTitleLabel() {
        view.addSubview(teamsLabelTitle)
        NSLayoutConstraint.activate([
            teamsLabelTitle.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 25),
            teamsLabelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    private func setupTeamsCollectionView() {
        view.addSubview(teamsCollectionView)
        NSLayoutConstraint.activate([
            teamsCollectionView.topAnchor.constraint(equalTo: teamsLabelTitle.bottomAnchor, constant: 10),
            teamsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            teamsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            teamsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.id, for: indexPath) 
                as? TeamsCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(TeamDetailsVC(), animated: true)
    }
}

