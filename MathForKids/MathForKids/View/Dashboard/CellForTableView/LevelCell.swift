//
//  LevelCell.swift
//  MathForKids

//  Copyright © 2021 Smriti. All rights reserved.


import UIKit

class LevelCell: UITableViewCell {
    @IBOutlet weak var lblLevel: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
