//
//  UIColor+Custom.swift
//  CoffeeCommon
//
//  Created by Denny on 2020/08/16.
//

import Foundation
import UIKit

public extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}

public extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hex = hex.deletingPrefix("#")
        hex = hex.deletingPrefix("0x")
        if hex.count != 6 {
            print("")
        }
        
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff
        
        self.init(red: CGFloat(red) / 0xff, green: CGFloat(green) / 0xff, blue: CGFloat(blue) / 0xff, alpha: alpha)
    }

    static var talkGray900s: UIColor { fetchTalkColor(#function) }
    static var talkGray800s: UIColor { fetchTalkColor(#function) }
    static var talkGray700s: UIColor { fetchTalkColor(#function) }
    static var talkGray600s: UIColor { fetchTalkColor(#function) }
    static var talkGray500s: UIColor { fetchTalkColor(#function) }
    static var talkGray400s: UIColor { fetchTalkColor(#function) }
    static var talkGray300s: UIColor { fetchTalkColor(#function) }
    static var talkGray050s: UIColor { fetchTalkColor(#function) }
    static var talkGray001s: UIColor { fetchTalkColor(#function) }
    static var talkGray000s: UIColor { fetchTalkColor(#function) }
    
    static var talkGray200a: UIColor { fetchTalkColor(#function) }
    static var talkGray150a: UIColor { fetchTalkColor(#function) }
    static var talkGray100a: UIColor { fetchTalkColor(#function) }
    static var talkGray050a: UIColor { fetchTalkColor(#function) }
    static var talkGray000a: UIColor { fetchTalkColor(#function) }
    
    static var talkWhite002s: UIColor { fetchTalkColor(#function) }
    static var talkWhite001s: UIColor { fetchTalkColor(#function) }
    static var talkWhite000s: UIColor { fetchTalkColor(#function) }
    
    static var talkYellow500s: UIColor { fetchTalkColor(#function) }
    static var talkYellow550s: UIColor { fetchTalkColor(#function) }
    static var talkYellow600s: UIColor { fetchTalkColor(#function) }
    
    static var talkRed500s: UIColor { fetchTalkColor(#function) }
    
    static var talkBlue300s: UIColor { fetchTalkColor(#function) }
    static var talkBlue500s: UIColor { fetchTalkColor(#function) }
    
    static var talkGreen500s: UIColor { fetchTalkColor(#function) }

    private static func fetchTalkColor(_ name: String) -> UIColor {
        let name = name.replacingOccurrences(of: "talk", with: "").lowercased()
        let assetName = "talk_\(name)"
        guard let color = UIColor(named: assetName, in: Bundle.coffeeCommon, compatibleWith: nil) else {
            assertionFailure()
            return .darkGray
        }
        return color
    }
        
}

public extension UIColor {
    convenience init(rgb: UInt32) {
        self.init(
            red: CGFloat(((rgb >> 16) & 0xFF)) / 255.0,
            green: CGFloat(((rgb >> 8) & 0xFF)) / 255.0,
            blue: CGFloat((rgb & 0xFF)) / 255.0,
            alpha: 1.0
        )
    }

    convenience init(rgb: UInt32, alpha: Float) {
        self.init(
            red: CGFloat(((rgb >> 16) & 0xFF)) / 255.0,
            green: CGFloat(((rgb >> 8) & 0xFF)) / 255.0,
            blue: CGFloat((rgb & 0xFF)) / 255.0,
            alpha: CGFloat(alpha)
        )
    }

    convenience init(rgba: UInt32) {
        self.init(
            red: CGFloat(((rgba >> 24) & 0xFF)) / 255.0,
            green: CGFloat(((rgba >> 16) & 0xFF)) / 255.0,
            blue: CGFloat(((rgba >> 8) & 0xFF)) / 255.0,
            alpha: CGFloat((rgba & 0xFF)) / 255.0
        )
    }
}
