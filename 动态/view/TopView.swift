//
//  TopView.swift
//  新浪微博
//
//  Created by 周杰 on 16/8/31.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit

class TopView: UIView {
    
    fileprivate lazy var topBgImg:UIImageView={
        let topBgImg=UIImageView(image: UIImage(named: "dynamic_bg.jpg"))
        topBgImg.contentMode=UIViewContentMode.scaleAspectFill
        topBgImg.clipsToBounds=true
        return topBgImg
    }()
    
    fileprivate lazy var photoImg:UIImageView={
        let photoImg=UIImageView()
        photoImg.layer.cornerRadius=40
        photoImg.backgroundColor=UIColor.orange
        //        photoImg.image=UIImage(named: photo)
        //        photoImg=CGAffineTransformMakeScale(0.8, 0.8) //或frame
        return photoImg
    }()
    
    fileprivate lazy var name:UILabel={
        let name=UILabel()
        name.font=UIFont.systemFont(ofSize: 16)
        name.textColor=UIColor.orange
        return name
    }()
    
    fileprivate lazy var deviceImg:UIImageView={
        var theImg=UIImage(named: "ic_phone")
        theImg=theImg!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let deviceImg=UIImageView()
        deviceImg.image=theImg
        deviceImg.tintColor=UIColor.orange
        deviceImg.transform=CGAffineTransform(scaleX: 1.2, y: 1.2)
        return deviceImg
    }()
    
    fileprivate lazy var deviceType:UILabel={
        let deviceType=UILabel()
        deviceType.font=UIFont.systemFont(ofSize: 14)
        deviceType.textColor=UIColor.orange
        return deviceType
    }()
    
    fileprivate lazy var location:UILabel={
        let location=UILabel()
        location.font=UIFont.systemFont(ofSize: 14)
        location.textColor=UIColor.orange
        return location
    }()
    
    fileprivate lazy var todayVisiter:UILabel={
        let todayVisiter=UILabel()
        todayVisiter.font=UIFont.systemFont(ofSize: 14)
        todayVisiter.textColor=UIColor.orange
        todayVisiter.text="今日访客:"
        return todayVisiter
    }()
    
    fileprivate lazy var todayVistNum:UILabel={
        let todayVistNum=UILabel()
        todayVistNum.font=UIFont.systemFont(ofSize: 14)
        todayVistNum.textColor=UIColor.orange
        return todayVistNum
    }()
    
    fileprivate lazy var totalVisiter:UILabel={
        let totalVisiter=UILabel()
        totalVisiter.font=UIFont.systemFont(ofSize: 14)
        totalVisiter.textColor=UIColor.orange
        totalVisiter.text="总浏览量:"
        return totalVisiter
    }()
    
    fileprivate lazy var totalVistNum:UILabel={
        let totalVistNum=UILabel()
        totalVistNum.font=UIFont.systemFont(ofSize: 14)
        totalVistNum.textColor=UIColor.orange
        return totalVistNum
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        setTestDatas()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews(){
        self.addSubview(topBgImg)
        self.addSubview(photoImg)
        self.addSubview(name)
        self.addSubview(deviceImg)
        self.addSubview(deviceType)
        self.addSubview(location)
        self.addSubview(todayVisiter)
        self.addSubview(todayVistNum)
        self.addSubview(totalVisiter)
        self.addSubview(totalVistNum)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topBgImg.snp.makeConstraints { (make) in
            make.edges.equalTo(self).offset(0)
        }
        photoImg.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(HEIGHT_DYNAMIC(80))
            make.left.equalTo(self).offset(WIDTH_DYNAMIC(20))
            make.width.height.equalTo((80))
        }
        
        name.snp.makeConstraints { (make) in
            make.top.equalTo(photoImg.snp.top).offset(HEIGHT_DYNAMIC(10))
            make.left.equalTo(photoImg.snp.right).offset(WIDTH_DYNAMIC(20))
        }
        deviceImg.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(HEIGHT_DYNAMIC(8))
            make.left.equalTo(name.snp.left).offset(WIDTH_DYNAMIC(2))
            
        }
        deviceType.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(HEIGHT_DYNAMIC(5))
            make.left.equalTo(deviceImg.snp.right).offset(WIDTH_DYNAMIC(5))
        }
        location.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(HEIGHT_DYNAMIC(5))
            make.left.equalTo(deviceType.snp.right).offset(WIDTH_DYNAMIC(20))
        }
        
        todayVisiter.snp.makeConstraints { (make) in
            make.top.equalTo(location.snp.bottom).offset(HEIGHT_DYNAMIC(10))
            make.left.equalTo(name.snp.left).offset(0)
        }
        todayVistNum.snp.makeConstraints { (make) in
            make.top.equalTo(location.snp.bottom).offset(HEIGHT_DYNAMIC(10))
            make.left.equalTo(todayVisiter.snp.right).offset(WIDTH_DYNAMIC(10))
        }
        totalVisiter.snp.makeConstraints { (make) in
            make.top.equalTo(todayVisiter.snp.top)
            make.left.equalTo(todayVistNum.snp.right).offset(WIDTH_DYNAMIC(20))
        }
        totalVistNum.snp.makeConstraints { (make) in
            make.top.equalTo(totalVisiter.snp.top)
            make.left.equalTo(totalVisiter.snp.right).offset(WIDTH_DYNAMIC(10))
        }
        
    }
    
    func setTestDatas(){
        name.text="盖尔加朵"
        deviceType.text="iphone6s plus"
        location.text="福建 福州"
        todayVistNum.text="133"
        totalVistNum.text="3561"
    }

}
