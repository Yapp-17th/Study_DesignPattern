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
    case school
    
    public func getTitle() -> String {
        switch self {
        case .computer:
            return "컴퓨터공학부"
        case .mechanic:
            return "기계공학부"
        case .school:
            return "학교 공지"
        }
    }
    
    public func getURLString(page: Int) -> String {
        switch self {
        case .computer:
            return "https://cse.snu.ac.kr/department-notices?&keys=&page=\(page - 1)"
        case .mechanic:
            return "http://me.snu.ac.kr/board/notice"
        case .school:
            return "https://www.snu.ac.kr/snunow/notice/genernal?page=\(page)"
        }
    }
}

public class NoticeListFetcher {
    public static let shared: NoticeListFetcher = NoticeListFetcher()
    
    private init() { }
    
    public func getNoticeList(dept: Dept, page: Int, completion: @escaping ([NoticeItem]) -> Void) {
        let url = URL(string: dept.getURLString(page: page))!
        let request = NoticeHTTPRequest(url: url, method: .get, encoding: .urlQuery)
        
        request.performRequest(completion: { result in
            
        })
    }
}
