//
//  PokedexEntryViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class PokedexEntryViewController: UIViewController {
    
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
    
    
    private lazy var typeView: PokedexSectionView = {
        let typeView = PokedexSectionView(
            title: "Type",
            value: "Electric",
            backgroundColor: .darkGray
        )
        return typeView
    }()
    
    private lazy var categoryView: PokedexSectionView = {
        let categoryView = PokedexSectionView(
            title: "Category",
            value: "Mouse Pokémon",
            backgroundColor: UIColor(named: "Background Color")!
        )
        return categoryView
    }()
    
    private lazy var heightView: PokedexSectionView = {
        let heightView = PokedexSectionView(
            title: "Height",
            value: "1'04",
            backgroundColor: .darkGray
        )
        return heightView
    }()
    
    private lazy var weightView: PokedexSectionView = {
        let weightView = PokedexSectionView(
            title: "Weight",
            value: "13.2 lbs",
            backgroundColor: UIColor(named: "Background Color")!
        )
        return weightView
    }()
    
    private lazy var entryView: PokedexSectionView = {
        let entryView = PokedexSectionView(
            title: "Entry",
            value: "Possesses cheek sacs in which it stores electricity. This clever forest-dweller roasts tough berries with an electric shock before consuming them.",
            backgroundColor: .darkGray)
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

}
