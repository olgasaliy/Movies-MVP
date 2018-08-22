//
//  ViewController.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class MoviesController: UITableViewController {

    @IBOutlet weak var tableHeaderView: UIView!
    let searchController = UISearchController(searchResultsController: nil)
    
    private let dataProvider = SearchResultDataProvider()
    private var moviesArray = [MovieItem]()
    private var moviesArraySearch = [MovieItem]()
    
    private var isSearching = false

    var presenter: MoviesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearch()
        
        presenter = MoviesPresenterImpl(self, dataProvider)
        presenter?.search(by: "hello")
    }
    
    private func initSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
    }
    
    private func toggleHeaderView() {
        if tableView.tableHeaderView == nil {
            tableView.tableHeaderView = tableHeaderView
        } else {
            tableView.tableHeaderView = nil
        }
    }

}

extension MoviesController: MoviesView {
   
    func show(error: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: error,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func display(movies: [MovieItem]) {
        moviesArray = movies
        toggleHeaderView()
        tableView.reloadData()
    }

}

extension MoviesController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  isSearching ? moviesArraySearch.count : moviesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item =  isSearching ? moviesArraySearch[indexPath.row] : moviesArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        item.configure(cell: cell)
        return cell
    }
    
}

extension MoviesController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            isSearching = true
            moviesArraySearch = moviesArray.filter { $0.title.contains(text) }
            tableView.reloadData()
        }
    }
    
}

extension MoviesController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            isSearching = false
            moviesArray = []
            presenter?.search(by: text)
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }
    
}
