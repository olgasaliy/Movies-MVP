//
//  MovieDetailsController.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class MovieDetailsController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    
    private let dataProvider = MoviesDataProvider()
    
    var presenter: MovieDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = MovieDetailsPresenterImpl(self, dataProvider)
        presenter?.getDetails(by: 232)
    }
}

extension MovieDetailsController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

extension MovieDetailsController: MovieDetailsView {
    
    func show(error: String) {
        
    }
    
    func display(details: TableViewCellItem) {
        
    }
    
    
}
