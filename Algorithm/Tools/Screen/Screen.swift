//
//  Screen.swift
//  walle
//
//  Created by mac on 2021/8/25.
//

import UIKit

/// 屏幕宽
let kScreenWidth : CGFloat = UIScreen.main.bounds.size.width

/// 屏幕高
let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height

/// 屏幕适配比例（宽）
let ratio = kScreenWidth/375.0

/// 屏幕适配比例（高）
let ratio_h = kScreenHeight/667.0

/// 字体适配比列
let ratio_font = kScreenWidth > 414.0 ? 1.0 : ratio

class Screen: NSObject {
    
    /// 屏幕宽度
    class func width() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    /// 屏幕高度
    class func height() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    /// 获取状态栏的高度
    /// - Returns: 状态栏的高度
    class func statusBarHeight() -> CGFloat {
        if #available(iOS 14.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            if ((scene?.isKind(of: UIWindowScene.self)) != nil) {
                let a = scene as! UIWindowScene
                return a.statusBarManager?.statusBarFrame.size.height ?? 20
            }else {
                return 20
            }
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
    
    /// 获取导航栏高度
    /// - Returns: 返回导航栏的高度
    class func navBarHeight() -> CGFloat {
        return Screen.statusBarHeight() + 44
    }
    
    /// 获取底部安全区域的高度
    /// - Returns: 返回底部安全区域的高度
    class func safeAreaBottom() -> CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }
    
    /// 获取tabbar的高度
    /// - Returns: 返回tabbar的高度
    class func tabBarHeight() -> CGFloat {
        return 49.0 + Screen.safeAreaBottom()
    }
    
}


