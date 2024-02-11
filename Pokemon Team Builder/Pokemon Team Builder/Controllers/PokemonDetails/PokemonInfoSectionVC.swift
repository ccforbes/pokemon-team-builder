//
//  PokemonInfoViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/8/24.
//

import UIKit

class PokemonInfoSectionVC: UIViewController {
    
    // MARK: - Properties
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        return stackView
    }()
    
    private lazy var nicknameCustomization: CustomizationInputView = {
        let nicknameCustomization = CustomizationInputView(
            title: "Nickname",
            inputMethod: .text,
            values: ["Pikachu"]
        )
        return nicknameCustomization
    }()
    
    private lazy var itemCustomization: CustomizationInputView = {
        let itemCustomization = CustomizationInputView(
            title: "Item",
            inputMethod: .dropdown,
            values: ["Light Ball", "Thunder Stone", "Pikashunium Z"]
        )
        return itemCustomization
    }()
    
    private lazy var abilitiesCustomization: CustomizationInputView = {
        let abilitiesCustomization = CustomizationInputView(
            title: "Ability",
            inputMethod: .dropdown,
            values: ["Static", "Lightning Rod"]
        )
        return abilitiesCustomization
    }()
    
    private lazy var natureCustomization: CustomizationInputView = {
        let natureCustomization = CustomizationInputView(
            title: "Nature",
            inputMethod: .dropdown,
            values: ["Jolly", "Modest"]
        )
        return natureCustomization
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        [nicknameCustomization, itemCustomization, abilitiesCustomization, natureCustomization].forEach { view in
            contentStackView.addArrangedSubview(view)
        }
        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
