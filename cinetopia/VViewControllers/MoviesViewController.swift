//
//  MoviesViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 23/02/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private var listMovies = movies
    private let cellIdentifier = "movie-cell"
    
    private let movieService = MovieService()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar filme"
        searchBar.searchTextField.backgroundColor = .white
        //searchBar.backgroundColor = .backgroundButton
        searchBar.delegate = self
        
        return searchBar
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view-did-load")
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        setupNavigationBar()
        addSubViews()
        setupConstraints()
        
        movieService.getMovies { movies in
            print("get movies in ViewController\n\(movies)")
        }
    }
    
    @objc private func hideKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    private func addSubViews() {
        view.addSubview(tableView)
        view.addSubview(searchBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.titleView = searchBar
        
        navigationItem.setHidesBackButton(true, animated: true)
        let navigationBar = navigationController?.navigationBar
        navigationBar?.standardAppearance.configureWithOpaqueBackground()
        navigationBar?.standardAppearance.backgroundColor = .background
        navigationBar?.standardAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBar?.scrollEdgeAppearance = navigationBar?.standardAppearance
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        title = "Filmes populares"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("view-will-appear")
        navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.showsCancelButton = listMovies.count != movies.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view-did-apper")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view-will-disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view-did-disappear")
    }

}

extension MoviesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MovieTableViewCell {
            cell.setupCell(movie: listMovies[indexPath.row])
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = MovieDetailViewController(movie: listMovies[indexPath.row])
        hideKeyboard()
        navigationController?.pushViewController(
            detailViewController,
            animated: true
        )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
}

extension MoviesViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        if searchText.count > 0 {
            listMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        } else {
            listMovies = movies
        }
        
        tableView.reloadData()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = false
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("clear button clicked")
        searchBar.showsCancelButton = false
        hideKeyboard()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
