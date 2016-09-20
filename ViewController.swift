//
//  ViewController.swift
//  ZBlog
//
//  Created by 周杰 on 16/9/19.
//  Copyright © 2016年 jielun. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn=UIButton()
        btn.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(0)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

