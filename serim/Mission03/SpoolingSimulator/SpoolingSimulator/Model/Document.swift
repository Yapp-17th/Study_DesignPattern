//
//  Document.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/02.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Document {
    let id: String
    let title: String
    let line: Int
    
    init(id: String, _ title: String, line: Int) {
        self.id = id
        self.title = title
        self.line = line
    }
    
    let makeId: () -> String = {
        let fullId = UUID().uuidString
        let startIndex = fullId.startIndex
        let lastIndex = fullId.index(startIndex, offsetBy: 4)
        return String(fullId[startIndex...lastIndex])
    }
}
