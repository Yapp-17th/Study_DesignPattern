//
//  SavedDocument.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/09.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class SavedDocument {
    static let shared = SavedDocument()
    
    var savedDocument: [Document] = []
    
    private init() { }
}
