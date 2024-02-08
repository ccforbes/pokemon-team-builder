//
//  PokemonViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/7/24.
//

import UIKit

class PokemonViewController: UIViewController {
    
    // MARK: - Properties
    
    private let pokedexEntryContainerView: UIView = {
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
        setupPokedexEntrySection()
    }
    
    private func setupPokedexEntrySection() {
        view.addSubview(pokedexEntryContainerView)
        NSLayoutConstraint.activate([
            pokedexEntryContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokedexEntryContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokedexEntryContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokedexEntryContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
        let pokedexEntryViewController = PokedexEntryViewController()
        addChild(pokedexEntryViewController)
        pokedexEntryContainerView.addSubview(pokedexEntryViewController.view)
        pokedexEntryViewController.didMove(toParent: self)
        pokedexEntryViewController.view.frame = pokedexEntryContainerView.frame
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
