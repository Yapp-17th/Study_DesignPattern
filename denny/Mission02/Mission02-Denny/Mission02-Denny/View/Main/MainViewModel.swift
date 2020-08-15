//
//  MainViewModel.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/15.
//

import CoffeeCommon
import Combine
import Foundation

public class MainViewModel: NSObject, ObservableObject {
    @Published var title: String = "Test"
    
    func fetch() {
        let randomNumber = Int.random(in: 0..<50)
        title = "Random number (\(randomNumber))"
    }
}
