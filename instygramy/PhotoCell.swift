//
//  PhotoCell.swift
//  instygramy
//
//  Created by Andrew Rivera on 3/20/16.
//  Copyright © 2016 Andrew Rivera. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var instagramPost: PFObject! {
        didSet {
            self.postedImage.file = instagramPost["media"] as? PFFile
            self.postedImage.loadInBackground()
            self.captionLabel.text = instagramPost["caption"] as? String
            self.usernameLabel.text = PFUser.currentUser()?.username
        
        }
    }

    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
