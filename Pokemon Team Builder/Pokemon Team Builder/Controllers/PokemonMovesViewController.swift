//
//  PokemomMovesViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/9/24.
//

import UIKit

class PokemonMovesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 18, bottom: 0, right: 18)
        return stackView
    }()
    
    private lazy var moveCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width / 2.3, height: view.frame.height / 12)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "Background Color")
        collectionView.dataSource = self
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
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupMoveCollectionView()
    }
    
    private func setupMoveCollectionView() {
        contentStackView.addArrangedSubview(moveCollectionView)
        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - DataSource Extension

extension PokemonMovesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: - Refactor cell to use specifically for moves
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamMembersCollectionViewCell.id, for: indexPath) as?
                TeamMembersCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
