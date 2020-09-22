//
//  Button.swift
//  Mission4
//
//  Created by dohan on 22/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}

class MenuBtn: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: )
        setupButton()
    }
    
    func setupButton(){
        
    }
    
}
