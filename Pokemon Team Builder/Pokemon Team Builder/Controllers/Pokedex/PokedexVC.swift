//
//  PokedexViewController.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/21/24.
//

import UIKit

class PokedexVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var pokedexTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(PokedexTableViewCell.self, forCellReuseIdentifier: PokedexTableViewCell.id)
        tableView.separatorColor = UIColor(named: "Stroke")
        return tableView
    }()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background Color")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background Color")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Pokédex"
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupPokedexTableView()
    }
    
    private func setupPokedexTableView() {
        view.addSubview(pokedexTableView)
        NSLayoutConstraint.activate([
            pokedexTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokedexTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokedexTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pokedexTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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

extension PokedexVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 151
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokedexTableViewCell.id, for: indexPath)
                as? PokedexTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
