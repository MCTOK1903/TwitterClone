//
//  ExploreController.swift
//  TwitterClone
//
//  Created by MCT on 5.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

private let reuseIdentifierUserCell = "UserCell"

class ExploreController: UITableViewController {
    
    //MARK: - Properties
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifierUserCell)
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
    }
    
    
}

extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUserCell, for: indexPath) as! UserCell
        
        return cell
    }
}
