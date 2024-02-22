//
//  PokedexEntryViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class PokemonPokedexSectionVC: UIViewController {
    
    // MARK: - Properties
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let pokedexEntrySection: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let pokemonImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Background Color")
        view.layer.borderColor = UIColor(named: "Stroke")?.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let pokemonImageView: UIImageView = {
        let image = UIImage(named: "Pikachu")
        let resizedImage = TempUtils.resizeImage(image: image!, targetSize: CGSizeMake(100, 100))
        let imageView = UIImageView(image: resizedImage!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var typeView: DescriptorView = {
        let typeView = DescriptorView(
            title: "Type",
            value: "Electric",
            fontSize: 11,
            includesTitle: true,
            backgroundColor: .darkGray
        )
        return typeView
    }()
    
    private lazy var categoryView: DescriptorView = {
        let categoryView = DescriptorView(
            title: "Category",
            value: "Mouse Pokémon",
            fontSize: 11,
            includesTitle: true,
            backgroundColor: UIColor(named: "Background Color")!
        )
        return categoryView
    }()
    
    private lazy var heightView: DescriptorView = {
        let heightView = DescriptorView(
            title: "Height",
            value: "1'04",
            fontSize: 11,
            includesTitle: true,
            backgroundColor: .darkGray
        )
        return heightView
    }()
    
    private lazy var weightView: DescriptorView = {
        let weightView = DescriptorView(
            title: "Weight",
            value: "13.2 lbs",
            fontSize: 11,
            includesTitle: true,
            backgroundColor: UIColor(named: "Background Color")!
        )
        return weightView
    }()
    
    private lazy var entryView: DescriptorView = {
        let entryView = DescriptorView(
            title: "Entry",
            value: "Possesses cheek sacs in which it stores electricity. This clever forest-dweller roasts tough berries with an electric shock before consuming them.",
            fontSize: 11,
            includesTitle: false,
            backgroundColor: .darkGray
        )
        return entryView
    }()
    
    private let type: String
    private let category: String
    private let height: String
    private let weight: String
    private let entry: String
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.pokemonImageContainerViewTapped))
        pokemonImageContainerView.addGestureRecognizer(gesture)
        setupUI()
    }
    
    // MARK: - Initializers
    
    init(
        type: String = "",
        category: String = "",
        height: String = "",
        weight: String = "",
        entry: String = ""
    ) {
        self.type = type
        self.category = category
        self.height = height
        self.weight = weight
        self.entry = entry
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupPokemonImage()
        setupPokedexEntrySection()
        setupContainerStackView()
    }
    
    private func setupPokemonImage() {
        pokemonImageContainerView.addSubview(pokemonImageView)
        NSLayoutConstraint.activate([
            pokemonImageView.centerXAnchor.constraint(equalTo: pokemonImageContainerView.centerXAnchor),
            pokemonImageView.centerYAnchor.constraint(equalTo: pokemonImageContainerView.centerYAnchor)
        ])
    }
    
    private func setupPokedexEntrySection() {
        [typeView, categoryView, heightView, weightView, entryView].forEach { view in
            pokedexEntrySection.addArrangedSubview(view)
        }
    }
    
    private func setupContainerStackView() {
        containerStackView.addArrangedSubview(pokemonImageContainerView)
        containerStackView.addArrangedSubview(pokedexEntrySection)
        view.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            containerStackView.heightAnchor.constraint(equalTo: view.heightAnchor)
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
    
    @objc private func pokemonImageContainerViewTapped(_ sender: UITapGestureRecognizer) {
        navigationController?.pushViewController(PokedexVC(), animated: true)
    }

}
