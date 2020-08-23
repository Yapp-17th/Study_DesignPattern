//
//  Barista.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

class Barista {
    let id: String
    var isWorking = false
    
    init(id: String) {
        self.id = id
    }
    
    func make(coffee: Coffee) {
        isWorking = true
        print("Barista #\(self.id) -> \(coffee.type) 제조 시작!")
        sleep(coffee.makingTime)
        print("Barista #\(self.id) -> \(coffee.type) 제조 완료!")
        isWorking = false
    }
}
