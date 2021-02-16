//
//  ViewController.swift
//  lab3
//
//  Created by Melanie Chavez on 2/16/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var genreList = [String]()
    var genresData = GenresDataLoader()
    let dataFile = "genres"
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genresData.loadData(filename: dataFile)
        genreList=genresData.getGenres()
        
        //enables large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        resultsController.allwords = genreList //set the allwords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }
    
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreList.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistIdentifier", for: indexPath)
        cell.textLabel?.text = genreList[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artistsegue" {
            if let detailVC = segue.destination as? DetailTableViewController { if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    //sets the data for the destination controller
                    detailVC.title = genreList[indexPath.row]
                    detailVC.genresData = genresData
                    detailVC.selectedGenre = indexPath.row
                }
            }
        }
    }

}

