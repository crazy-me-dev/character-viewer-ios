//
//  TopicCell.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import UIKit

class TopicCell: UITableViewCell {

    @IBOutlet weak var labelCharacterName: UILabel!
    
    @IBOutlet weak var labelCharacterDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
