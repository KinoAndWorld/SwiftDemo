//
//  JazzyDemo.swift
//  Swift-Project-Demo
//
//  Created by 陈文杰 on 2021/12/21.
//

import UIKit

/**
 重要的协议
---
 可以调用
 ```
someImp.funcA(x) 来进行操作
 ```
 也可以使用
 ```
 let a = someImp.funcB("xx")
 ```
 得到结果
 */
public protocol JazzyDemoProtocol {
    /// 暴露的方法A 用来做某事
    func funcA(a: Int)

    /// 暴露的方法B  用来做某某事
    /// - Returns: 返回一个数值
    func funcB(b: String) -> Int
}


/// 关键类名 - JazzyDemo
/// 作用是 🆙🆙🆙🆙🆙🆙🆙
public class JazzyDemo {
    /// 时代的Style
    enum Style {
        /// 某样式A
        case styleA
        /// 某样式B
        case styleB
        /// 某样式C
        case styleC
    }

    /// 关键变量名
    public var varib: String = "默认值"

    /**
     aaa默认实现
     在`合适的时候`会自动调用
      - Parameter n: 整形变量，确保*n* > 0
      - Returns: 字符串
     */
    open func aaa(n: Int) -> String {
        return ""
    }

}
