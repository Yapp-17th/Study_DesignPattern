//
//  NetworkRequest.swift
//  Mission06-Denny
//
//  Created by denny on 2020/10/31.
//

import Foundation
import Alamofire

public struct NoticeItem {
    public var title: String?
    public var url: String?
    public var createdAt: Date?
    public var author: String?
}

public enum Dept: CaseIterable {
    case computer
    case mechanic
    case medical
}

public class NoticeListFetcher {
    public static let shared: NoticeListFetcher = NoticeListFetcher()
    
    private init() { }
    
    public func getNoticeList(dept: Dept) -> [NoticeItem]? {
        
        return nil
    }
}
