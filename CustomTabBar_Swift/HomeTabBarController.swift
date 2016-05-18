//
//  HomeTabBarController.swift
//  CustomTabBar_Swift
//
//  Created by 陈舒澳 on 16/5/18.
//  Copyright © 2016年 speeda. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController,CustomTabBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = CustomTabBar()
        tabBar.delegate_customTabBar = self
        self.setValue(tabBar, forKey: "tabBar")
        
        
        // Do any additional setup after loading the view.
    }
    func CustomTabBatButtonClicked(tabBar: CustomTabBar) {
        print("CustomTabBatButtonClicked---fuzongjian")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
