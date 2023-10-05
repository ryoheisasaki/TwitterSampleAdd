//
//  TableViewCell.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/15.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {
    /// delegateのプロパティ
    var delegate: TableViewCellDelegate?
    /// 値渡しなどで利用するのでクラス内にTweetCellModelのプロパティ
    var tweetData = TweetCellModel()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    
    @IBAction func cellEdit(_ sender: Any) {
        // 別の画面に遷移
        delegate?.segue(tweetData: tweetData)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(tweetCell: TweetCellModel) {
        tweetData = tweetCell
        self.name.text = tweetData.name as String
        self.mainText.text = tweetData.mainText as String
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
