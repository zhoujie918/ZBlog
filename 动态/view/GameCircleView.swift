//
//  GameCircleView.swift
//  新浪微博
//
//  Created by 周杰 on 16/9/3.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


private let topViewHeight:CGFloat=220

class GameCircleView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var gameCircleList:[GameCircleModel]?

    fileprivate let topView=TopView()
    
    lazy var tbView:UITableView={
        let tbView=UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tbView.delegate=self
        tbView.dataSource=self
        tbView.contentInset=UIEdgeInsetsMake(topViewHeight, 0, 0, 0)
        tbView.setContentOffset(CGPoint(x: 0,y: -topViewHeight), animated: false)
        tbView.rowHeight=UITableViewAutomaticDimension
        tbView.estimatedRowHeight=44
        return tbView
    }()
    
    
    fileprivate lazy var navTitleView:UIView={
        let navTitleView=UIView()
        navTitleView.backgroundColor=UIColor.cyan
        return navTitleView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func addViews(){
        self.addSubview(tbView)
        self.addSubview(navTitleView)
        
        tbView.addSubview(topView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.gameCircleList?.count>0 {
            return self.gameCircleList!.count
        }else{
            return 0
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cell=tbView.dequeueReusableCell(withIdentifier: "cell") as! GameCircleTableViewCell!
        if (cell==nil){
            cell=GameCircleTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            
        }
        cell?.gameCircleModel=self.gameCircleList![(indexPath as NSIndexPath).row]
        return 100+cell!.setTextSize()+(cell?.setImageFrame(arrayImages as NSArray).height)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tbView.dequeueReusableCell(withIdentifier: "cell") as! GameCircleTableViewCell!
        if (cell==nil){
            cell=GameCircleTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            
        }
            cell?.gameCircleModel=self.gameCircleList![(indexPath as NSIndexPath).row]

        return cell!
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offY = scrollView.contentOffset.y
        navTitleView.alpha = (offY + 64) / (topViewHeight - 64)+1

    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(tbView).offset(-topViewHeight)
            make.left.equalTo(self).offset(0)
            make.width.equalTo(self.bounds.width)
            make.height.equalTo(topViewHeight)
        }
        tbView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self).offset(0)
            make.size.equalTo(self.bounds.size)
        }
        navTitleView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(0)
            make.left.equalTo(self).offset(0)
            make.width.equalTo(self.bounds.width)
            make.height.equalTo(64)
        }
    }
    
    
}



