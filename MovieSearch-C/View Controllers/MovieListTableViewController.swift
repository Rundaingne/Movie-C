//
//  MovieListTableViewController.swift
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//
//Woot! Back to Swift B)

import UIKit

class MovieListTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    //Source of truth for this tableView.
    var movies: [RUNMovie] = [] {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Methods
    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! RUNMovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
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

//Gotta make a searchBarDelegate to use this fancy thing.
extension MovieListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = movieSearchBar.text, !searchText.isEmpty else {return}
        RUNMovieClient.searchMovies(withSearchTerm: searchText) { (movies) in
            self.movies = movies
        }
    }
}
//Strange, but calling the searchMovies function in the extension loads my empty source of truth immediately after someone begins searching. I suppose I could do it in the viewDidLoad as well to make it load up with some data, but that caused some issues last time. Might be a bit much.g
