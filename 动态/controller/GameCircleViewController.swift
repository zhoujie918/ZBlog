//
//  GameCircleViewController.swift
//  AppStore
//
//  Created by 周杰 on 16/8/29.
//  Copyright © 2016年 iMac. All rights reserved.
//

import UIKit
import Alamofire


class GameCircleViewController: UIViewController {
    
    let url="http://news-at.zhihu.com/api/4/news/latest"

    fileprivate var gameCircleView=GameCircleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initNavBar()
        getNewsData()
    }
    
    
    func getNewsData(){
        var circleList:[GameCircleModel]=[]
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result{
            case .success(let data):
                guard let stories=(data as? NSDictionary)?.object(forKey: "stories") as? NSArray else {return}
                for i in 0...stories.count-1 {
                    guard let id=(stories[i] as AnyObject).object(forKey: "id") as? Int else {return}
                    guard let title=(stories[i] as AnyObject).object(forKey: "title") as? String else {return}
                    guard let images=((stories[i] as AnyObject).object(forKey: "images")! as? NSArray)?[0] as? String else {return}
                    let model=GameCircleModel(id: id, newsTitle: title, newsImageName: images)
                    circleList.append(model)
                }
                self.gameCircleView.gameCircleList=circleList
                self.gameCircleView.tbView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func initView(){
        self.view.addSubview(gameCircleView)
        gameCircleView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).offset(0)
        }
    }
     
    func initNavBar(){
        self.automaticallyAdjustsScrollViewInsets=false
        self.title="动态"
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:UIColor.orange]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage=UIImage()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
    }
    
}
