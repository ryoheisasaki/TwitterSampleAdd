//
//  TwitterSampleTests.swift
//  TwitterSampleTests
//
//  Created by 佐々木遼平 on 2023/09/12.
//

import XCTest

let maxCharacterCount = 43

final class TwitterSampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //文字数が43文字を超えないようにする。文字数制限
       func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           //入力された変更を行った場合の文字数を計算。
           let newCharacterCount = textView.text.count - range.length + text.count

           //43文字以下でtrueを返し、43文字超でfalseを返す
           return (newCharacterCount <= maxCharacterCount)
       }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        
    }


