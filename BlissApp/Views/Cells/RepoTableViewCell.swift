//
//  RepoTableViewCell.swift
//  BlissApp
//
//  Created by Eren Erten on 27.02.2023.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var repoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(repo:RepoModel?) {
        repoName.text = repo?.fullName
    }
     
}
