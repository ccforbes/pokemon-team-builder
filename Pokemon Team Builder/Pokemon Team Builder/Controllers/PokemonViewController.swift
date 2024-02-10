//
//  PokemonViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class PokemonViewController: UIViewController {
    
    // MARK: - Properties
    
    private let pokedexEntryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokédex"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let pokedexEntryContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pokemonInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Information"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let pokemonInfoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pokemonMovesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Moves"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let pokemonMovesContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background Color")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Pokémon"
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupPokedexEntryLabel()
        setupPokedexEntrySection()
        setupPokemonInfoLabel()
        setupPokemonInfoSection()
        setupPokemonMovesLabel()
        setupPokemonMovesSection()
    }
    
    private func setupPokedexEntryLabel() {
        view.addSubview(pokedexEntryLabel)
        NSLayoutConstraint.activate([
            pokedexEntryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            pokedexEntryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }
    
    private func setupPokedexEntrySection() {
        view.addSubview(pokedexEntryContainerView)
        NSLayoutConstraint.activate([
            pokedexEntryContainerView.topAnchor.constraint(equalTo: pokedexEntryLabel.bottomAnchor, constant: 10),
            pokedexEntryContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokedexEntryContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokedexEntryContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        let pokedexEntryViewController = PokedexEntryViewController()
        addChild(pokedexEntryViewController)
        pokedexEntryContainerView.addSubview(pokedexEntryViewController.view)
        pokedexEntryViewController.didMove(toParent: self)
        pokedexEntryViewController.view.frame = pokedexEntryContainerView.frame
    }
    
    private func setupPokemonInfoLabel() {
        view.addSubview(pokemonInfoLabel)
        NSLayoutConstraint.activate([
            pokemonInfoLabel.topAnchor.constraint(equalTo: pokedexEntryContainerView.bottomAnchor, constant: 20),
            pokemonInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }
    
    private func setupPokemonInfoSection() {
        view.addSubview(pokemonInfoContainerView)
        NSLayoutConstraint.activate([
            pokemonInfoContainerView.topAnchor.constraint(equalTo: pokemonInfoLabel.bottomAnchor),
            pokemonInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokemonInfoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        let pokemonInfoViewController = PokemonInfoViewController()
        addChild(pokemonInfoViewController)
        pokemonInfoContainerView.addSubview(pokemonInfoViewController.view)
        pokemonInfoViewController.didMove(toParent: self)
        pokemonInfoViewController.view.frame = pokemonInfoContainerView.frame
    }
    
    private func setupPokemonMovesLabel() {
        view.addSubview(pokemonMovesLabel)
        NSLayoutConstraint.activate([
            pokemonMovesLabel.topAnchor.constraint(equalTo: pokemonInfoContainerView.bottomAnchor, constant: 20),
            pokemonMovesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
        ])
    }
    
    private func setupPokemonMovesSection() {
        view.addSubview(pokemonMovesContainerView)
        NSLayoutConstraint.activate([
            pokemonMovesContainerView.topAnchor.constraint(equalTo: pokemonMovesLabel.bottomAnchor),
            pokemonMovesContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonMovesContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokemonMovesContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        let pokemonMovesViewController = PokemonMovesViewController()
        addChild(pokemonMovesViewController)
        pokemonMovesContainerView.addSubview(pokemonMovesViewController.view)
        pokemonMovesViewController.didMove(toParent: self)
        pokemonMovesViewController.view.frame = pokemonMovesContainerView.frame
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
