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
    
    var tweetDataList: [TweetCellModel] = []
    
    // 遷移先に渡したい値を格納する変数を用意する
    var editData = TweetCellModel()
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addButton(_ sender: UIButton) {}
    
    // Viewが生成された最初の一回だけ走るライフサイクルメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        setTweetData()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
    }
    
    // viewが表示される前に走るライフサイクルメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTweetData()
    }
    
    // TwitterViewControllerのdelegateプロパティに自身を代入
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            let nextView = segue.destination as! TwitterViewController
            nextView.delegate = self
            nextView.tweetData = editData
        }
        editData = TweetCellModel()
    }
    
    //投稿ボタンを円形にする
    func configureButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
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
        cell.delegate = self
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
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        )
        return ceil(boundingBox.height)
    }
}

// delegateプロパティに自身が代入されている時使用される関数の処理を記述
extension HomeViewController: TwitterViewControllerDelegate {
    func didPostTweet() {
        setTweetData()
    }
}

extension HomeViewController: TableViewCellDelegate {
    func segue(tweetData: TweetCellModel) {
        editData = tweetData
        // 別の画面に遷移
        performSegue(withIdentifier: "toNext", sender: nil)
    }
}
