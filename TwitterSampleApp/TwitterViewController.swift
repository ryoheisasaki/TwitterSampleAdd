//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/27.
//

import Foundation
import UIKit
import RealmSwift

// TwitterViewControllerDelegate プロトコルの定義
protocol TwitterViewControllerDelegate: AnyObject {
    func didPostTweet(_ tweet: TweetCellModel)
}


class TwitterViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    let tweetData = TweetCellModel()
    
    // TwitterViewControllerDelegate プロトコルへの準拠を宣言
    weak var delegate: TwitterViewControllerDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainTextView:
    UITextView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func cancelActionButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var postOutletAddButton: UIButton!
    
    //投稿ボタン
    @IBAction func postAddButton(_ sender: UIButton) {
        
        tweetData.name = nameTextField.text ?? ""
        tweetData.mainText = mainTextView.text ?? ""
        
        
        //テキストフィールドとテキストビューの値を取得する
        let name = nameTextField.text ?? ""
        let mainText = mainTextView.text ?? ""
        
        // 値を保存する
        saveData(name: name, mainText: mainText)
        
        // デリゲートメソッドを呼び出す
        delegate?.didPostTweet(tweetData)
        
        // ビューコントローラーを閉じる
        self.dismiss(animated: true, completion: nil)
        
        
    }
    func saveData(name: String, mainText: String) {
        let realm = try! Realm()
        try! realm.write {
            tweetData.name = name
            tweetData.mainText = mainText
            realm.add(tweetData)
            print("😃\(tweetData)")
        }
    }
    
    private var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.becomeFirstResponder()
        self.mainTextView.becomeFirstResponder()
        postOutletAddButton.backgroundColor = UIColor.yellow
        postOutletAddButton.layer.cornerRadius = 10
        postOutletAddButton.layer.borderWidth = 0.5
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
}




