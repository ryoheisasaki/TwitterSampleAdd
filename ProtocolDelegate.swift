//
//  ProtocolDelegate.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/08/24.
//

import Foundation

protocol greetingDelegate {

    func sayHello()
    func sayName()
    func sayAge()
}

extension greetingDelegate {

    // デフォルト実装
    // プロトコル適合先で実装しなくてもエラーにならなくなる
    func sayAge() {
        print("My age is 10")
    }
}
