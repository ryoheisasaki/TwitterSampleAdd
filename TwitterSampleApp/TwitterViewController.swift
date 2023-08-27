//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/27.
//

import Foundation
import UIKit
import RealmSwift

class TwitterViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    weak var delegate: TwitterViewControllerDelegate? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func cancelActionButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var postOutletAddButton: UIButton!
    
    //投稿ボタン
    @IBAction func postAddButton(_ sender: UIButton) {
        //テキストフィールドとテキストビューの値を取得する
        let name = nameTextField.text ?? ""
        let mainText = mainTextView.text ?? ""
        
        // 値を保存する
        saveData(name: name, mainText: mainText)
        
        // デリゲートメソッドを呼び出して通知を送る
        delegate?.didPostTweet()
        
        // viewを閉じる
        self.dismiss(animated: true)
    }
    
    // Viewが生成された最初の一回だけ走るライフサイクルメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.becomeFirstResponder()
        self.mainTextView.becomeFirstResponder()
        postOutletAddButton.backgroundColor = UIColor.yellow
        postOutletAddButton.layer.cornerRadius = 10
        postOutletAddButton.layer.borderWidth = 0.5
        
        print(delegate ?? "nil")
        
    }
    
    // 入力データをRealmに保存する
    func saveData(name: String, mainText: String) {
        let realm = try! Realm()
        try! realm.write {
            let tweetData = TweetCellModel()
            tweetData.name = name
            tweetData.mainText = mainText
            realm.add(tweetData)
        }
    }
}
