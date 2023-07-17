//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/01.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tweetDataList: [Tweet] = []
    override func viewDidLoad() {
        setMemoData()
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func setMemoData() {
        for i in 1...6 {
            let tweetData = Tweet(tweetText: "本文\(i)", userName: "ヤマタク")
                tweetDataList.append(tweetData)
        }
    }
    
}


