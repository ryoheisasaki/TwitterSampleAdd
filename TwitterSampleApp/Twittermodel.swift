//
//  Stationmodel.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/15.
//

import Foundation

class TweetCell : NSObject {
    //ここで"ヤマタク"を格納
    var name: String
    //ここで"本文1"などを格納
    var mainText: String
    
    init(name: String, mainText: String){
        self.name = name
        self.mainText = mainText
    }
}
