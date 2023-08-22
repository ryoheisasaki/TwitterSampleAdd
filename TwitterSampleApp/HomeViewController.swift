//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/01.
//

import Foundation
import UIKit
import RealmSwift


class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addButton(_ sender: UIButton) {}
    
    var tweetDataList: [TweetCellModel] = []
    
    //ライフメソッド　起動時に実行される　viewDidLoad ロードされる
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        setTweetData()
        let tweetView = TwitterViewController()
        
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
        
        //投稿ボタンを円形にする
        func configureButton() {
            addButton.layer.cornerRadius = addButton.bounds.width / 2
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTweetData()
        
    }
    
    func setTweetData() {
        let realm = try! Realm()
        let result = realm.objects(TweetCellModel.self)
        tweetDataList = Array(result)
        
        //テーブルビュー更新
        tableView.reloadData()
        
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let tweetData = tweetDataList[indexPath.row]
        cell.setCell(tweetCell: tweetData)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        return UITableView.automaticDimension
    }
}

extension String {
    // 文字列の高さを計算するための拡張メソッド
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        return ceil(boundingBox.height)
    }
    
}


