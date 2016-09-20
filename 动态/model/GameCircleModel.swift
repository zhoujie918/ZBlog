//
//  GameCircleModel.swift
//  新浪微博
//
//  Created by 周杰 on 16/9/5.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit
import Alamofire

class GameCircleModel: NSObject {
    
    var id:Int!
    var newsTitle:String!
    var newsImageName:String!
    
    init(id:Int,newsTitle:String,newsImageName:String) {
        self.id=id
        self.newsTitle=newsTitle
        self.newsImageName=newsImageName
    }
    func abc(){
        print("abc")
    }

}
