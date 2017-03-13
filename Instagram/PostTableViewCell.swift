//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by SongYuda on 3/12/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit
import Parse
import ParseUI
class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: PFImageView!
  
    @IBOutlet weak var captionLabel: UILabel!
    
    var instagramPost: PFObject! {
        didSet {
        
            self.photoView.file = instagramPost["media"] as? PFFile
            
            self.captionLabel.text = instagramPost["caption"] as? String
            
            self.photoView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
