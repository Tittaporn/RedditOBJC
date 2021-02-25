//
//  PostTableViewCell.swift
//  Reddit-C
//
//  Created by Bryan Workman on 2/24/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postCommentCountLabel: UILabel!
    @IBOutlet weak var postUpsLabel: UILabel!
    
    //MARK: - Properties
    var post: DVMPost? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let post = post else {return}
        postTitleLabel.text = post.title
        postCommentCountLabel.text = "\(post.commentCount) comments"
        postUpsLabel.text = "\(post.ups) up-votes"
    }
    
    
} //End of class
