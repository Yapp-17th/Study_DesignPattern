//
//  NoticeListViewModel.swift
//  Mission06-Denny
//
//  Created by denny on 2020/10/31.
//

import Foundation
import Combine

public class NoticeListViewModel: ObservableObject, Identifiable {
    @Published var dept: Dept = .computer
    @Published var noticeList: [NoticeItem] = [NoticeItem]()
    
    public func fetchNoticeList() {
        NoticeListFetcher.shared.getNoticeList(dept: dept, page: 0, completion: { list in
            self.noticeList = list
        })
    }
}
