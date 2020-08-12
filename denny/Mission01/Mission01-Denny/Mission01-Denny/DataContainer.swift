//
//  DataContainer.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation

public class DataContainer: NSObject {
    public static let shared = DataContainer()
    private override init() { }
    
    private var pendingOrderList: [Order]?
    
    public func getPendingOrderList() -> [Order]? {
        return pendingOrderList
    }
    
    public func getPendingOrderListCount() -> Int {
        return pendingOrderList?.count ?? 0
    }
    
    public func appendPendingOrder(order: Order) {
        pendingOrderList?.append(order)
    }
    
    public func removeAllOrderList() {
        pendingOrderList?.removeAll()
    }
}
