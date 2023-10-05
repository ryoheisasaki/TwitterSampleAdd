//
//  TableViewCellDelegate.swift
//  TwitterSampleApp
//
//  Created by 武久 なおき on 2023/09/06.
//

import Foundation

protocol TableViewCellDelegate {
    func segue(tweetData: TweetCellModel)
}
