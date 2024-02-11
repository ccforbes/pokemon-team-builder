//
//  TeamInformationViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class TeamInfoSectionVC: UIViewController {
    
    // MARK: - Properties
    
    private let teamInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Information"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.layoutMargins = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        return label
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        return stackView
    }()
    
    private let teamInfoEditSectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let teamNameTextInput: UITextField = {
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
        textInput.font = UIFont.systemFont(ofSize: 12)
        return textInput
    }()
    
    private lazy var teamDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .darkGray
        textView.isEditable = true
        textView.text = "Description"
        textView.textColor = .lightGray
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private let gameVersionLogoImageViewWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Background Color")
        view.layer.borderColor = UIColor(named: "Stroke")?.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var gameVersionLogoImageView: UIImageView = {
        let image = UIImage(named: "Legends Arceus Logo")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(150, 150))
        let imageView = UIImageView(image: resizedImage!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
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
        setupContentStackView()
    }
    
    private func setupTeamInfoLabel() {
        view.addSubview(teamInfoLabel)
        NSLayoutConstraint.activate([
            teamInfoLabel.topAnchor.constraint(equalTo: view.topAnchor),
            teamInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }
    
    private func setupTeamInfoEditSection() {
        teamInfoEditSectionStackView.addArrangedSubview(teamNameTextInput)
        teamInfoEditSectionStackView.addArrangedSubview(teamDescriptionTextView)
        view.addSubview(teamInfoEditSectionStackView)
        NSLayoutConstraint.activate([
            teamInfoEditSectionStackView.topAnchor.constraint(equalTo: teamInfoLabel.bottomAnchor),
            teamInfoEditSectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teamInfoEditSectionStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            teamInfoEditSectionStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupGameVersionLogoImageView() {
        gameVersionLogoImageViewWrapper.addSubview(gameVersionLogoImageView)
        NSLayoutConstraint.activate([
            gameVersionLogoImageView.centerXAnchor.constraint(equalTo: gameVersionLogoImageViewWrapper.centerXAnchor),
            gameVersionLogoImageView.centerYAnchor.constraint(equalTo: gameVersionLogoImageViewWrapper.centerYAnchor)
        ])
    }
    
    private func setupContentStackView() {
        contentStackView.addArrangedSubview(teamInfoEditSectionStackView)
        contentStackView.addArrangedSubview(gameVersionLogoImageViewWrapper)
        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: teamInfoLabel.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

// MARK: - TextView Delegate Extension

extension TeamInfoSectionVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = UIColor.lightGray
        }
    }
}
