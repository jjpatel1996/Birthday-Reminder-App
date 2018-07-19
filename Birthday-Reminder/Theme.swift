//
//  Theme.swift
//  Birthday-Reminder
//
//  Created by Jay Patel on 19/07/18.
//  Copyright © 2018 Jay Patel. All rights reserved.
//

import Foundation
import UIKit

class Theme {
    static var current:ThemeProtocol = WhiteTheme()
}

protocol ThemeProtocol {
    var mainFont:String { get }
    var NavigationBarColor:UIColor { get }
    var NavigationTitleColor:UIColor { get }
    var NavigationTintColor:UIColor { get }
}

/*
 NavigationBlackTitleColor
 NavigationBTitleColor
 NavigationTitleColor
 
 */

class WhiteTheme: ThemeProtocol {
    
    var mainFont:String = ""
    var NavigationBarColor:UIColor = UIColor(named: "WhiteNavigationBar")!
    var NavigationTitleColor:UIColor = UIColor(named: "WhiteNavigationTitle")!
    var NavigationTintColor:UIColor = UIColor(named: "WhiteNavigationTint")!
    
}

class BlackTheme: ThemeProtocol {
    
    var mainFont:String = ""
    var NavigationBarColor:UIColor = UIColor(named: "BlackNavigationBar")!
    var NavigationTitleColor:UIColor = UIColor(named: "BlackNavigationTitle")!
    var NavigationTintColor:UIColor = UIColor(named: "BlackNavigationTint")!
    
}

class BlueTheme: ThemeProtocol {
    
    var mainFont:String = ""
    var NavigationBarColor:UIColor = UIColor(named: "BlueNavigationBar")!
    var NavigationTitleColor:UIColor = UIColor(named: "BlueNavigationTitle")!
    var NavigationTintColor:UIColor = UIColor(named: "BlueNavigationTint")!
    
}
