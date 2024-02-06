//
//  TeamViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/3/24.
//

import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - Properties
    
    let teamInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Information"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let teamInfoWrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let teamNameTextInput: UITextField = {
        let textInput = UITextField()
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.textColor = .white
        textInput.borderStyle = .roundedRect
        textInput.backgroundColor = .darkGray
        textInput.attributedPlaceholder = NSMutableAttributedString(
            string: "Name",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        return textInput
    }()
    
    lazy var teamDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .darkGray
        textView.isEditable = true
        textView.textColor = .white
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    lazy var gameVersionLogoImageView: UIImageView = {
        let image = UIImage(named: "Legends Arceus Logo")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(150, 150))
        let imageView = UIImageView(image: resizedImage!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        setupTeamInfoLabel()
        setupTeamInfoEditSection()
        setupGameVersionLogoImageView()
        
        setupTeamMembersLabel()
        setupTeamMembersCollectionView()
    }
    
    private func setupTeamInfoLabel() {
        view.addSubview(teamInfoLabel)
        NSLayoutConstraint.activate([
            teamInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            teamInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }
    
    private func setupTeamInfoEditSection() {
        setupTeamInfoWrapperView()
        setupTeamNameTextField()
        setupTeamDescriptionTextView()
    }
    
    private func setupTeamInfoWrapperView() {
        view.addSubview(teamInfoWrapperView)
        NSLayoutConstraint.activate([
            teamInfoWrapperView.topAnchor.constraint(equalTo: teamInfoLabel.bottomAnchor, constant: 10),
            teamInfoWrapperView.leadingAnchor.constraint(equalTo: teamInfoLabel.leadingAnchor),
            teamInfoWrapperView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 2.2)),
            teamInfoWrapperView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height / 1.8))
        ])
    }
    
    private func setupTeamNameTextField() {
        teamInfoWrapperView.addSubview(teamNameTextInput)
        NSLayoutConstraint.activate([
            teamNameTextInput.topAnchor.constraint(equalTo: teamInfoWrapperView.topAnchor),
            teamNameTextInput.leadingAnchor.constraint(equalTo: teamInfoWrapperView.leadingAnchor),
            teamNameTextInput.trailingAnchor.constraint(equalTo: teamInfoWrapperView.trailingAnchor),
        ])
    }
    
    private func setupTeamDescriptionTextView() {
        teamInfoWrapperView.addSubview(teamDescriptionTextView)
        NSLayoutConstraint.activate([
            teamDescriptionTextView.topAnchor.constraint(equalTo: teamNameTextInput.bottomAnchor, constant: 5),
            teamDescriptionTextView.leadingAnchor.constraint(equalTo: teamInfoWrapperView.leadingAnchor),
            teamDescriptionTextView.trailingAnchor.constraint(equalTo: teamInfoWrapperView.trailingAnchor),
            teamDescriptionTextView.bottomAnchor.constraint(equalTo: teamInfoWrapperView.bottomAnchor),
        ])
    }
    
    private func setupGameVersionLogoImageView() {
        view.addSubview(gameVersionLogoImageView)
        NSLayoutConstraint.activate([
            gameVersionLogoImageView.leadingAnchor.constraint(equalTo: teamNameTextInput.trailingAnchor, constant: 10),
            gameVersionLogoImageView.centerYAnchor.constraint(equalTo: teamInfoWrapperView.centerYAnchor),
        ])
    }
    
    private func setupTeamMembersLabel() {
        view.addSubview(teamMembersLabel)
        NSLayoutConstraint.activate([
            teamMembersLabel.topAnchor.constraint(equalTo: teamDescriptionTextView.bottomAnchor, constant: 10),
            teamMembersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
        ])
    }
    
    private func setupTeamMembersCollectionView() {
        view.addSubview(teamMembersCollectionView)
        NSLayoutConstraint.activate([
            teamMembersCollectionView.topAnchor.constraint(equalTo: teamMembersLabel.bottomAnchor, constant: 10),
            teamMembersCollectionView.leadingAnchor.constraint(equalTo: teamMembersLabel.leadingAnchor),
            teamMembersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            teamMembersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height / 12)),
        ])
    }
    
    private func setupTeamInformationLabel() {
        view.addSubview(teamInfoLabel)
        NSLayoutConstraint.activate([
            teamInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }

}

// MARK: - DataSource Extension

extension TeamViewController: UICollectionViewDataSource {
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
