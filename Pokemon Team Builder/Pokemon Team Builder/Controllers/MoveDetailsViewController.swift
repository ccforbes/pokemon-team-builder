//
//  MoveViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/9/24.
//

import UIKit

class MoveDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var nameView: DescriptorView = {
        let nameView = DescriptorView(
            title: "Name",
            value: "Volt Tackle",
            fontSize: 16,
            includesTitle: true,
            backgroundColor: .darkGray
        )
        return nameView
    }()
    
    private lazy var typeView: DescriptorView = {
        let typeView = DescriptorView(
            title: "Type",
            value: "Electric",
            fontSize: 16,
            includesTitle: true,
            backgroundColor: UIColor(named: "Background Color")!
        )
        return typeView
    }()
    
    private lazy var categoryView: DescriptorView = {
        let categoryView = DescriptorView(
            title: "Category",
            value: "Physical",
            fontSize: 16,
            includesTitle: true,
            backgroundColor: .darkGray
        )
        return categoryView
    }()
    
    private lazy var powerPointsView: DescriptorView = {
        let powerPointsView = DescriptorView(
            title: "PP",
            value: "15",
            fontSize: 16,
            includesTitle: true,
            backgroundColor: UIColor(named: "Background Color")!
        )
        return powerPointsView
    }()
    
    private lazy var powerView: DescriptorView = {
        let powerView = DescriptorView(
            title: "Power",
            value: "120",
            fontSize: 16,
            includesTitle: true,
            backgroundColor: .darkGray
        )
        return powerView
    }()
    
    private lazy var accuracyView: DescriptorView = {
        let accuracyView = DescriptorView(
            title: "Accuracy",
            value: "100",
            fontSize: 16,
            includesTitle: true,
            backgroundColor: UIColor(named: "Background Color")!
        )
        return accuracyView
    }()
    
    private lazy var descriptionView: DescriptorView = {
        let descriptionView = DescriptorView(
            title: "Description",
            value: "The user electrifies itself and charges the target to inflict damage. This also damages the user quite a lot and may leave the target with paralysis.",
            fontSize: 16,
            includesTitle: false,
            backgroundColor: .darkGray
        )
        return descriptionView
    }()
    
    private let movesInputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var movesInputView: CustomizationInputView = {
        let movesInputView = CustomizationInputView(
            title: "Move",
            inputMethod: .dropdown,
            values: ["Volt Tackle", "Thunderbolt", "ElectroWeb", "Iron Tail", "Quick Attack"]
        )
        return movesInputView
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background Color")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Move"
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        [
            nameView,
            typeView,
            categoryView,
            powerPointsView,
            powerView,
            accuracyView,
            descriptionView,
            movesInputView
        ].forEach { view in
            contentStackView.addArrangedSubview(view)
        }
        contentStackView.setCustomSpacing(10, after: descriptionView)
        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            contentStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35)
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
