//
//  TableViewCell.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/15.
//

import UIKit
import Foundation
import RealmSwift

protocol TableViewCellDelegate {
    func segue(tweetData: TweetCellModel)
    func relordTweetData()
    
}


class TableViewCell: UITableViewCell {
    
    //Delegateプロパティ
    var delegate: TableViewCellDelegate?
    
    //値渡しようTweetCellModelプロパティ
    var tweetData = TweetCellModel()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(tweetCell: TweetCellModel) {
        tweetData = tweetCell
        self.name.text = tweetCell.name as String
        self.mainText.text = tweetCell.mainText as String
    }
    
    //編集ボタン
    @IBOutlet weak var editButton: UIButton!
    @IBAction func cellEdit(_ sender: Any) {
        //別画面遷移
        delegate?.segue(tweetData: tweetData)
    }
    
    //削除ボタン
    @IBOutlet weak var deleateButton: UIButton!
    @IBAction func cellDeleate(_ sender: UIButton) {
        deleteCell()
        delegate?.relordTweetData()
    }
    
    func deleteCell() {
        let realm = try! Realm()
        let tweetRecord = Array(realm.objects(TweetCellModel.self).filter("id = %@", tweetData.id))
        try! realm.write {
            realm.delete(tweetRecord)
            
        }
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
