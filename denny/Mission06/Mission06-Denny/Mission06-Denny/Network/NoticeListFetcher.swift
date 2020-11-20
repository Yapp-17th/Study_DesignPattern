//
//  NetworkRequest.swift
//  Mission06-Denny
//
//  Created by denny on 2020/10/31.
//

import Foundation
import Alamofire
import Kanna

public struct NoticeItem {
    public var title: String?
    public var url: String?
    public var createdAt: Date?
    public var author: String?
}

public enum Dept: Int, CaseIterable {
    case computer = 0
    case mechanic = 1
    case school = 2
    
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
            return "https://me.snu.ac.kr/ko/board/notice/page/\(page)"
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
            switch result.result {
            case .success(_):
                if let data = result.value {
                    do {
                        let doc = try HTML(html: data, encoding: .utf8)
                        switch dept {
                        case .computer:
                            completion(self.parseComputer(document: doc))
                        case .mechanic:
                            completion(self.parseMechanic(document: doc))
                        case .school:
                            completion(self.parseSchool(document: doc))
                        }
                    } catch let error {
                        print("Error : \(error)")
                    }
                }
            case .failure(_):
                print("Error message:\(String(describing: result.error))")
                break
            }
        })
    }
    
    public func parseMechanic(document: HTMLDocument) -> [NoticeItem] {
        var titleList: [String] = []
        var dateList: [String] = []
        var authorList: [String] = []
        var noticeList: [NoticeItem] = []
        for (index, product) in document.xpath("//table[contains(@class, 'lc01')]/tbody/tr/*").enumerated() {
            let content = product.content?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            switch index % 4 {
            case 0:
                // Notice
                break
            case 1:
                // Category
                break
            case 2:
                // Title
                titleList.append(content)
            case 3:
                // Author
                authorList.append(content)
            case 4:
                // Date
                dateList.append(content)
            default:
                break
            }
        }
        
        for (index, title) in titleList.enumerated() {
            let dateString: String = dateList[index]
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy.MM.dd"
            dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

            let date: Date = dateFormatter.date(from: dateString)!
            noticeList.append(NoticeItem(title: title, url: nil, createdAt: date, author: authorList[index]))
        }
        return noticeList
    }
    
    public func parseSchool(document: HTMLDocument) -> [NoticeItem] {
        var titleList: [String] = []
        var dateList: [String] = []
        var noticeList: [NoticeItem] = []
        
        for (index, product) in document.xpath("//div[contains(@class, 'board-list')]/table/tbody/tr/*").enumerated() {
            let content = product.content?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            switch index % 2 {
            case 0:
                // Title
                titleList.append(content)
            case 1:
                // date
                dateList.append(content)
            default:
                break
            }
        }
        
        for (index, title) in titleList.enumerated() {
            let dateString: String = dateList[index]
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

            let date: Date = dateFormatter.date(from: dateString)!
            noticeList.append(NoticeItem(title: title, url: nil, createdAt: date, author: nil))
        }
        return noticeList
    }
    
    public func parseComputer(document: HTMLDocument) -> [NoticeItem] {
        var titleList: [String] = []
        var dateList: [String] = []
        var countList: [String] = []
        var noticeList: [NoticeItem] = []
        
        for (index, product) in document.xpath("//table/tbody/tr/*").enumerated() {
            print(product.content?.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "") ?? "nil")
            let content = product.content?.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "") ?? ""
            switch index % 3 {
            case 0:
                // Title
                titleList.append(content)
            case 1:
                // date
                dateList.append(content)
            case 2:
                // count
                countList.append(content)
            default:
                break
            }
        }
        
        for (index, title) in titleList.enumerated() {
            let dateString: String = dateList[index]
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

            let date: Date = dateFormatter.date(from: dateString)!
            noticeList.append(NoticeItem(title: title, url: nil, createdAt: date, author: nil))
        }
        return noticeList
    }
}
