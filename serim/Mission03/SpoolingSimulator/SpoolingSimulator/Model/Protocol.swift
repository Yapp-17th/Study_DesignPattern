//
//  Protocol.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/02.
//  Copyright © 2020 serim. All rights reserved.
//

import Foundation

protocol PrinterProtocol {
    func print(document: Document)
    func showProgress()
}
