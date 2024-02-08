//
//  TeamInformationViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class TeamInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    private let teamInfoLabel: UILabel = {
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
        return textInput
    }()
    
    private lazy var teamDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .darkGray
        textView.isEditable = true
        textView.textColor = .white
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
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
    }
    
    private func setupTeamInfoLabel() {
        view.addSubview(teamInfoLabel)
        NSLayoutConstraint.activate([
            teamInfoLabel.topAnchor.constraint(equalTo: view.topAnchor),
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
            teamInfoWrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            teamInfoWrapperView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
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

}

// MARK: - TextView Delegate Extension

extension TeamInfoViewController: UITextViewDelegate {
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
