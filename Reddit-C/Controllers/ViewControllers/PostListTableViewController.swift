//
//  PostListTableViewController.swift
//  Reddit-C
//
//  Created by Bryan Workman on 2/24/21.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Properties
    var posts: [DVMPost] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
} //End of class

extension PostListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        
        DVMPostController.shared()?.searchForPost(withSearchTerm: searchTerm) { (posts, error) in
            if let error = error {
                print("\(error.localizedDescription) --- \(error)")
            }
            DispatchQueue.main.async {
                self.posts = posts ?? []
                self.title = searchTerm
                
            }
        }
    }
}
