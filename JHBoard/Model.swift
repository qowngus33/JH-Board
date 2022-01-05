//
//  Model.swift
//  JHBoard
//
//  Created by 배주현 on 2022/01/05.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "hello how are you"),
        Memo(content: "nice to meet you")
    ]
}
