//
//  SwitchRootVC.swift
//  Mission06-Denny
//
//  Created by Denny on 2020/11/20.
//

import Foundation
import UIKit

public class SwitchRootVC {
    static func updateRootVC(vc: UIViewController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
    
    static func updateListVCForRoot() {
        if let navVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "listNavVC") as? NavigationViewController {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navVC
        }
    }
    
    static func updateRootNavVC(vc: NavigationViewController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
}

public class NavigationViewController: UINavigationController, UIGestureRecognizerDelegate {
    public override func viewDidLoad() {
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
