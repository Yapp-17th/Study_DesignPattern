//
//  Files.swift
//  Mission03
//
//  Created by dohan on 07/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation

struct FileStruct {
    let title:String
    let time:Int
    
}
struct QueueStruct {
    let index:Int
    var status:String
}

public class Files{
    static let shared = Files()
    private init(){
        
    }
 
    let fileList:[FileStruct] = [FileStruct(title: "디자인패턴의 모든 것.pdf", time: 4000),FileStruct(title: "Proxy Pattern.pdf", time: 2000),FileStruct(title: "커피숍 상반기 매출.docs", time: 3000),FileStruct(title: "프린터기 사용법.pdf", time: 2000)]
    
    func getFileList() -> [FileStruct] {
        return fileList
    }
    func getTitle(row: Int) -> String {
        return fileList[row].title
    }
    
    func getTime(row :Int) -> Int {
        return fileList[row].time
    }
    
     
    
}
