//
//  RecentsController.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 03/05/24.
//

import UIKit

class RecentsController: UIViewController {
    
    //MARK: Other variables
    private let recentCalls: [RecentCallModel] = [
        RecentCallModel(title: "+91 22-69910200",
                        subtitle: "+912269910200",
                        day: "Yesterday",
                        callType: .missed,
                        count: 1),
        
        RecentCallModel(title: "Ross Geller",
                        subtitle: "mobile",
                        day: "Yesterday",
                        callType: .outgoing,
                        count: 1),
        
        RecentCallModel(title: "+91 85866 51583",
                        subtitle: "India",
                        day: "Wednesday",
                        callType: .incoming,
                        count: 3),
        
        RecentCallModel(title: "Monica Geller",
                        subtitle: "mobile",
                        day: "Tuesday",
                        callType: .missed,
                        count: 1),
        
        RecentCallModel(title: "Rachel Green",
                        subtitle: "mobile",
                        day: "Monday",
                        callType: .outgoing,
                        count: 3),
        
        RecentCallModel(title: "Joey Tribbiani",
                        subtitle: "USA",
                        day: "Monday",
                        callType: .incoming,
                        count: 3),
        
        RecentCallModel(title: "Pheobe Buffay",
                        subtitle: "mobile",
                        day: "Monday",
                        callType: .missed,
                        count: 5)
    ]
    
    //MARK: UI View Variables
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 48, bottom: 0, right: 0)
        return tableView
    }()
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        setupNavBar()
        setupSegmentControl()
        setupTableView()
    }
    
    //MARK: Setup views
    private func registerCells() {
        tableView.register(RecentTableViewCell.self, forCellReuseIdentifier: RecentTableViewCell.identifier)
    }
    
    private func setupNavBar() {
        let leftItem = UIBarButtonItem(title: "Edit", image: nil, target: self, action: #selector(onEditTapped))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func setupSegmentControl() {
        let segment: UISegmentedControl = UISegmentedControl(items: ["All", "Missed"])
        segment.selectedSegmentIndex = 0
        self.navigationItem.titleView = segment
    }
    
    private func setupTableView() {
        tableView
            .add(to: view)
            .enableAutoLayout()
            .pinAllSides(to: view)
    }
    
    //MARK: Other methods
    @objc
    private func onEditTapped() {
        
    }
}

extension RecentsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentTableViewCell.identifier, for: indexPath) as? RecentTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(model: recentCalls[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recentCalls.count
    }
}
