//
//  UserCenterViewController.swift
//  新浪微博
//
//  Created by 周杰 on 16/9/3.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit

class UserCenterViewController: UIViewController {
    fileprivate lazy var btn:UIButton={
        let btn=UIButton()
        btn.frame=CGRect(x: 100, y: 300, width: 100, height: 100)
        btn.setTitle("下一页", for: UIControlState())
        btn.setTitleColor(UIColor.blue, for: UIControlState())
        btn.layer.borderWidth=1
        btn.addTarget(self, action: #selector(UserCenterViewController.pushNext), for: UIControlEvents.touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        self.view.addSubview(btn)

        self.title="设置"
        self.navigationItem.backBarButtonItem=UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor=UIColor.orange
    }
    func pushNext(){
        let vc=GameCircleViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
