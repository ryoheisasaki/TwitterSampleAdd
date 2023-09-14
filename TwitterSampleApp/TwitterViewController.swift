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
    
    // TwitterViewControllerDelegate プロトコルへの準拠を宣言
    weak var delegate: TwitterViewControllerDelegate?
    
    var tweetData = TweetCellModel()
    
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainTextView:
    UITextView!
    
    //文字数制限
    let maxCharacterCount = 43
    
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
        
        // デリゲートメソッドを呼び出す
        delegate?.didPostTweet(tweetData)
        
        // ビューコントローラーを閉じる
        self.dismiss(animated: true, completion: nil)
        
        
    }
    func saveData(name: String, mainText: String) {
        let realm = try! Realm()
        try! realm.write {
            let tweetData = tweetData
            tweetData.name = name
            tweetData.mainText = mainText
            realm.add(tweetData)
        }
    }
    
    private var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.becomeFirstResponder()
        self.mainTextView.becomeFirstResponder()
        self.nameTextField.text = tweetData.name
        self.mainTextView.text = tweetData.mainText
        postOutletAddButton.backgroundColor = UIColor.yellow
        postOutletAddButton.layer.cornerRadius = 10
        postOutletAddButton.layer.borderWidth = 0.5
        
        print(delegate ?? "nil")
        
        mainTextView.delegate = self

    }
    //文字数が43文字を超えないようにする。文字数制限
       func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           //入力された変更を行った場合の文字数を計算。
           let newCharacterCount = textView.text.count - range.length + text.count

           //43文字以下でtrueを返し、43文字超でfalseを返す
           return (newCharacterCount <= maxCharacterCount)
       }

   }
    
    





