//
//  Stationmodel.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/15.
//

import Foundation

class Station : NSObject {
    var name: String
    var prefecture: String
    
    init(name: String, prefecture: String){
        self.name = name as String
        self.prefecture = prefecture as String
    }
}
