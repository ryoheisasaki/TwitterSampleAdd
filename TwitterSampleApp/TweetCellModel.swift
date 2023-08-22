//
//  TweetCellModel.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/09.
//

import Foundation
import RealmSwift

class TweetCellModel: Object {
    
    @objc dynamic var id: String = UUID().uuidString

    // このTweetの主
    @objc dynamic var name: String = ""
    
    // Tweetの本文
    @objc dynamic var mainText: String = ""

}
