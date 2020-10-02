//
//  UIColor+Custom.swift
//  Mission04-Denny
//
//  Created by Denny on 2020/09/14.
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

    static var missionGray900s: UIColor { fetchTalkColor(#function) }
    static var missionGray800s: UIColor { fetchTalkColor(#function) }
    static var missionGray700s: UIColor { fetchTalkColor(#function) }
    static var missionGray600s: UIColor { fetchTalkColor(#function) }
    static var missionGray500s: UIColor { fetchTalkColor(#function) }
    static var missionGray400s: UIColor { fetchTalkColor(#function) }
    static var missionGray300s: UIColor { fetchTalkColor(#function) }
    static var missionGray050s: UIColor { fetchTalkColor(#function) }
    static var missionGray001s: UIColor { fetchTalkColor(#function) }
    static var missionGray000s: UIColor { fetchTalkColor(#function) }
    
    static var missionGray200a: UIColor { fetchTalkColor(#function) }
    static var missionGray150a: UIColor { fetchTalkColor(#function) }
    static var missionGray100a: UIColor { fetchTalkColor(#function) }
    static var missionGray050a: UIColor { fetchTalkColor(#function) }
    static var missionGray000a: UIColor { fetchTalkColor(#function) }
    
    static var missionWhite002s: UIColor { fetchTalkColor(#function) }
    static var missionWhite001s: UIColor { fetchTalkColor(#function) }
    static var missionWhite000s: UIColor { fetchTalkColor(#function) }
    
    static var missionYellow500s: UIColor { fetchTalkColor(#function) }
    static var missionYellow550s: UIColor { fetchTalkColor(#function) }
    static var missionYellow600s: UIColor { fetchTalkColor(#function) }
    
    static var missionRed500s: UIColor { fetchTalkColor(#function) }
    
    static var missionBlue300s: UIColor { fetchTalkColor(#function) }
    static var missionBlue500s: UIColor { fetchTalkColor(#function) }
    
    static var missionGreen500s: UIColor { fetchTalkColor(#function) }

    private static func fetchTalkColor(_ name: String) -> UIColor {
        let name = name.replacingOccurrences(of: "mission", with: "").lowercased()
        let assetName = "mission_\(name)"
        guard let color = UIColor(named: assetName, in: Bundle.main, compatibleWith: nil) else {
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
