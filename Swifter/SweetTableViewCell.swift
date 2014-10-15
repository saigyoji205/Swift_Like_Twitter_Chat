//
//  SweetTableViewCell.swift
//  Swifter
//
//  Created by Hirokazu on 2014/10/11.
//  Copyright (c) 2014年 Hirokazu. All rights reserved.
//

import UIKit

class SweetTableViewCell: UITableViewCell {
    
    
    @IBOutlet var usernameLabel: UILabel! = UILabel()
    @IBOutlet var timestampLabel: UILabel! = UILabel()
    @IBOutlet var sweetTextView: UITextView! = UITextView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
