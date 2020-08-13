//
//  UIFont+Custom.swift
//  Mission01-Denny
//
//  Created by Denny on 2020/08/12.
//  Copyright © 2020 Denny. All rights reserved.
//

import Foundation
import UIKit

public extension UIFont {
    class var font14P: UIFont {
        UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    class var font17P: UIFont {
        UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    class var font17PBold: UIFont {
        UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    class var font17PMedium: UIFont {
        UIFont.systemFont(ofSize: 17, weight: .medium)
    }
}
