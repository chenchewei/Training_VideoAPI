//
//  ScriptTableTableViewCell.swift
//  Training_VideoAPI
//
//  Created by mmslab-mini on 2020/7/6.
//  Copyright © 2020 mmslab-mini. All rights reserved.
//

import UIKit

class ScriptTableTableViewCell: UITableViewCell {

    @IBOutlet var ScriptLabel: UILabel!
    @IBOutlet var NoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(Scripts: String,No: Int,Time: CLong) {
        ScriptLabel.text = "  "+Scripts
        NoLabel.text = String(No)
    }
    
    func setCell(data: captions,No: Int) {
        ScriptLabel.text = data.content
        NoLabel.text = "\(No)"
    }
    
}
