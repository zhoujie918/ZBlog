//
//  GameCircleViewController.swift
//  AppStore
//
//  Created by 周杰 on 16/8/30.
//  Copyright © 2016年 iMac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit
import SDWebImage

//-------------屏幕尺寸--------------
let SCREEN_WIDTH=UIScreen.main.bounds.size.width
let SCREEN_HEIGHT=UIScreen.main.bounds.size.height

func WIDTH_DYNAMIC(_ width:CGFloat)->CGFloat{
    return width*1.0*SCREEN_WIDTH/375.0
}

func HEIGHT_DYNAMIC(_ height:CGFloat)->CGFloat{
    return height*1.0*SCREEN_HEIGHT/667.0
}

//－－－－－－－－－－－－－16进制颜色码转换－－－－－－－－－－－－－
extension UIColor {
    static func hexStringToColor(_ hexString: String) -> UIColor{
        var cString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {return UIColor.black}
        if cString.hasPrefix("0X") {cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 2))}
        if cString.hasPrefix("#") {cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))}
        if cString.characters.count != 6 {return UIColor.black}
        
        var range: NSRange = NSMakeRange(0, 2)
        
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
    }
}

let arrayImages=["photo1.jpg","photo2.jpg","photo3.jpg","photo4.jpg","photo5.jpg","photo6.jpg","photo7.jpg","photo8.jpg","photo9.jpg"]


//let arrayImages=[String]()
