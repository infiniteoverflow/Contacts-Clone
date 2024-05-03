//
//  FavouritesController.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 02/05/24.
//

import UIKit

class FavouritesController: UIViewController {
    
    private let favourites = [
        "Ross Geller",
        "Chandler Bing",
        "Monica Geller",
        "Rachel Green",
        "Joey Tribbiani",
        "Pheobe Buffay"
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        return tableView
    }()
    
    //MARK: View Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        setupNavBar()
        setupCollectionView()
    }
    
    //MARK: Setup views
    private func registerCells() {
        tableView.register(FavouritesTableViewCell.self, forCellReuseIdentifier: FavouritesTableViewCell.identifier)
    }
    
    private func setupNavBar() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddTapped))
        self.navigationItem.rightBarButtonItem  = rightButton
        
        let leftTextButton = UIBarButtonItem(title: "Edit", image: nil, target: self, action: #selector(onEditTapped))
        self.navigationItem.leftBarButtonItem  = leftTextButton
    }
    
    private func setupCollectionView() {
        tableView
            .add(to: view)
            .enableAutoLayout()
            .pinAllSides(to: view,
                         trailing: 16,
                         leading: 16)
    }
    
    //MARK: Other methods
    @objc
    private func onAddTapped() {
        
    }
    
    @objc
    private func onEditTapped() {
        
    }
}

extension FavouritesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouritesTableViewCell.identifier) as? FavouritesTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(name: favourites[indexPath.item])
        return cell
    }
}
