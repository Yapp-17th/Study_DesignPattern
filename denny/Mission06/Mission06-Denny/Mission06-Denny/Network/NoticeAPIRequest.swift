//
//  NoticeAPIRequest.swift
//  Mission06-Denny
//
//  Created by denny on 2020/11/01.
//

import Foundation
import Alamofire

public class HTTPBaseRequest: NSObject {
    public let url: URL
    public let httpMethod: HTTPMethod
    public var encoding: ParameterEncoding = Alamofire.URLEncoding.default
    
    public init(url: URL, method: RequestMethod = .get, encoding: RequestEncoding = .url) {
        self.url = url
        self.httpMethod = method.httpMethod
        self.encoding = encoding.parameterEncoding
    }
    
    public func performRequest(completion: @escaping (AFDataResponse<String>) -> Void) {
        AF.request(url).responseString(completionHandler: { result in
            completion(result)
        })
    }
    
    public enum RequestEncoding { // to remove alamofire dependencies in other targets
        case url
        case urlQuery
        case json
        
        var parameterEncoding: Alamofire.ParameterEncoding {
            switch self {
            case .url:
                return Alamofire.URLEncoding.default
            case .urlQuery:
                return Alamofire.URLEncoding.queryString
            case .json:
                return Alamofire.JSONEncoding.default
            }
        }
    }
    
    public enum RequestMethod {
        case get
        case post
        case put
        case delete
        case patch
        
        var httpMethod: Alamofire.HTTPMethod {
            switch self {
            case .get:
                return .get
            case .post:
                return .post
            case .put:
                return .put
            case .delete:
                return .delete
            case .patch:
                return .patch
            }
        }
    }
}

public class NoticeAPIRequest: HTTPBaseRequest {
    
}
