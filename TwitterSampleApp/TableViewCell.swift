//
//  TableViewCell.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/15.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(tweetCell: TweetCellModel) {
        self.name.text = tweetCell.name as String
        self.mainText.text = tweetCell.mainText as String
      }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
