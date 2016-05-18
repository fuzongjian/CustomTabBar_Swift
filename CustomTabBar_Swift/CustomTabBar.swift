//
//  CustomTabBar.swift
//  CustomTabBar_Swift
//
//  Created by 陈舒澳 on 16/5/17.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit
protocol CustomTabBarDelegate: UITabBarDelegate {
    func CustomTabBatButtonClicked(tabBar: CustomTabBar)
}
class CustomTabBar: UITabBar {
    var delegate_customTabBar: CustomTabBarDelegate?
    var customButton: UIButton?
    override init(frame: CGRect) {
        super.init(frame: frame)
        customButton = UIButton.init()
        customButton?.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        customButton?.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        customButton?.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        customButton?.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        customButton?.frame = CGRectMake(0, 0, (customButton?.currentBackgroundImage?.size.width)!, (customButton?.currentBackgroundImage?.size.height)!)
        customButton?.addTarget(self, action: "customButtonClicked:", forControlEvents: .TouchUpInside)
        self.addSubview(customButton!)
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func customButtonClicked(sender: UIButton){
        if delegate_customTabBar?.respondsToSelector("CustomTabBatButtonClicked:") == true{
            delegate_customTabBar?.CustomTabBatButtonClicked(self)
        }
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customButton?.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5)
        let tabBarW: CGFloat = self.frame.size.width / 3.0
        var tabBarIndex: CGFloat = 0.0
        for view: UIView in self.subviews{
            let newClass: AnyClass = NSClassFromString("UITabBarButton")!
            if view.isKindOfClass(newClass) == true{
                view.frame = CGRectMake(tabBarIndex * tabBarW, view.frame.origin.y, tabBarW, view.frame.size.height)
                tabBarIndex += 1.0
                if tabBarIndex == 1.0{
                    tabBarIndex += 1.0
                }
            }
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
