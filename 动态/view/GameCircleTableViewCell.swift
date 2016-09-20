//
//  GameCircleTableViewCell.swift
//  AppStore
//
//  Created by 周杰 on 16/8/29.
//  Copyright © 2016年 iMac. All rights reserved.
//

import UIKit

class GameCircleTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    let testString="读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣读读日报 24 小时热门 TOP 5 · 虽然是罪案剧，但它对破案毫无兴趣"
    
    
    var gameCircleModel:GameCircleModel?{
        didSet{
            headerImg.sd_setImage(with: URL(string: (gameCircleModel?.newsImageName)!))
            name.text=String(gameCircleModel!.id)
            blogText.text=gameCircleModel?.newsTitle
//            blogText.text=testString
//            blogImg.sd_setImageWithURL(NSURL(string: (gameCircleModel?.newsImageName)!))
        }
    }
    
    fileprivate lazy var ImgCollectionView:UICollectionView={
        let ImgCollectionView=UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        ImgCollectionView.dataSource=self
        ImgCollectionView.delegate=self
        ImgCollectionView.backgroundColor=UIColor.clear
        return ImgCollectionView
    }()
    
    fileprivate lazy var headerImg:UIImageView={
        let headerImg=UIImageView()
        headerImg.layer.borderWidth=0.2
        headerImg.layer.cornerRadius=17
        headerImg.clipsToBounds=true
        return headerImg
    }()
    
    
    fileprivate lazy var name:UILabel={
        let name=UILabel()
        name.textColor=UIColor.hexStringToColor("f8ac1a")
        name.font=UIFont.systemFont(ofSize: 14)
        return name
    }()

    fileprivate lazy var liverLb:UILabel={
        let liverLb=UILabel()
        liverLb.backgroundColor=UIColor.hexStringToColor("fb4f4f")
        liverLb.textColor=UIColor.white
        liverLb.text="主播"
        liverLb.font=UIFont.systemFont(ofSize: 12)
        liverLb.layer.masksToBounds=true
        liverLb.layer.cornerRadius=5
        liverLb.textAlignment=NSTextAlignment.center
        return liverLb
    }()
    
    fileprivate lazy var relaseDate:UILabel={
        let relaseDate=UILabel()
        relaseDate.textColor=UIColor.lightGray
        relaseDate.font=UIFont.systemFont(ofSize: 14)
        return relaseDate
    }()
    
    fileprivate lazy var deviceImg:UIImageView={
        let deviceImg=UIImageView(image: UIImage(named: "ic_phone"))
        deviceImg.transform=CGAffineTransform(scaleX: 1.2, y: 1.2)
        return deviceImg
    }()
    
    fileprivate lazy var deviceType:UILabel={
        let deviceType=UILabel()
        deviceType.font=UIFont.systemFont(ofSize: 14)
        deviceType.textColor=UIColor.lightGray
        return deviceType
    }()
    
    fileprivate lazy var reportBtn:UIButton={
        let reportBtn=UIButton()
        reportBtn.setBackgroundImage(UIImage(named: "ic_arrowdown"), for: UIControlState())
        return reportBtn
    }()
    
    fileprivate lazy var blogText:UILabel={
        let logText=UILabel()
        logText.numberOfLines=0
        logText.font=UIFont.systemFont(ofSize: 14)
        return logText
    }()
    
    fileprivate lazy var blogImg:UIView={
        let blogImg=UIView()
        return blogImg
    }()
    
    fileprivate lazy var tips:UIImageView={
        let tips=UIImageView(image: UIImage(named: "ic_tips"))
        return tips
    }()
    
    fileprivate lazy var tipsValue:UILabel={
        let tipsValue=UILabel()
        tipsValue.textColor=UIColor.lightGray
        tipsValue.font=UIFont.systemFont(ofSize: 14)
        return tipsValue
    }()
    
    fileprivate lazy var likeNor:UIImageView={
        let likeNor=UIImageView(image: UIImage(named: "ic_like_nor"))
        return likeNor
    }()
    
    fileprivate lazy var likeNum:UILabel={
        let likeNum=UILabel()
        likeNum.textColor=UIColor.lightGray
        likeNum.font=UIFont.systemFont(ofSize: 14)
        return likeNum
    }()

    fileprivate lazy var comment:UIImageView={
        let comment=UIImageView(image: UIImage(named: "ic_comment"))
        return comment
    }()
    
    fileprivate lazy var commentNum:UILabel={
        let commentNum=UILabel()
        commentNum.font=UIFont.systemFont(ofSize: 14)
        commentNum.textColor=UIColor.lightGray
        return commentNum
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
        setTestDatas()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews(){
        self.addSubview(headerImg)
        self.addSubview(name)
//        self.addSubview(liverLb)
        self.addSubview(relaseDate)
        self.addSubview(deviceImg)
        self.addSubview(deviceType)
        self.addSubview(reportBtn)
        self.addSubview(blogText)
        self.addSubview(blogImg)
        self.addSubview(tips)
        self.addSubview(tipsValue)
        self.addSubview(likeNor)
        self.addSubview(likeNum)
        self.addSubview(comment)
        self.addSubview(commentNum)
        
        blogImg.addSubview(ImgCollectionView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        headerImg.snp.makeConstraints { (make) in
            make.width.height.equalTo(34)
            make.top.equalTo(self).offset(HEIGHT_DYNAMIC(10))
            make.left.equalTo(self).offset(WIDTH_DYNAMIC(10))
        }
        
        name.snp.makeConstraints { (make) in
            make.left.equalTo(headerImg.snp.right).offset(WIDTH_DYNAMIC(10))
            make.top.equalTo(self).offset(HEIGHT_DYNAMIC(10))
        }
//        liverLb.snp.makeConstraints { (make) in
//            make.left.equalTo(name.snp.right).offset(WIDTH_DYNAMIC(5))
//            make.bottom.equalTo(name.snp.bottom).offset(0)
//            make.width.equalTo(30)
//        }
        relaseDate.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(HEIGHT_DYNAMIC(10))
            make.left.equalTo(headerImg.snp.right).offset(WIDTH_DYNAMIC(10))
        }
        deviceImg.snp.makeConstraints { (make) in
            make.top.equalTo(relaseDate.snp.top).offset(HEIGHT_DYNAMIC(3))
            make.left.equalTo(relaseDate.snp.right).offset(WIDTH_DYNAMIC(10))
        }
        deviceType.snp.makeConstraints { (make) in
            make.top.equalTo(relaseDate.snp.top).offset(0)
            make.left.equalTo(deviceImg.snp.right).offset(5)
        }
        
        blogText.snp.makeConstraints { (make) in
            make.top.equalTo(relaseDate.snp.bottom).offset(HEIGHT_DYNAMIC(10))
            make.left.equalTo(relaseDate.snp.left).offset(0)
            make.width.lessThanOrEqualTo(self.bounds.width-80)
        }
        
        blogImg.snp.makeConstraints { (make) in
            make.top.equalTo(blogText.snp.bottom).offset(HEIGHT_DYNAMIC(-10))
            make.left.equalTo(blogText.snp.left).offset(0)
            make.width.height.equalTo(300)
        }
        
        tips.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(HEIGHT_DYNAMIC(-10))
            make.left.equalTo(name.snp.left).offset(0)
        }
        tipsValue.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(HEIGHT_DYNAMIC(-8))
            make.left.equalTo(tips.snp.right).offset(5)
        }
        likeNor.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(HEIGHT_DYNAMIC(-10))
            make.left.equalTo(tipsValue.snp.right).offset(WIDTH_DYNAMIC(140))
        }
        likeNum.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(HEIGHT_DYNAMIC(-8))
            make.left.equalTo(likeNor.snp.right).offset(5)
        }
        comment.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(HEIGHT_DYNAMIC(-8))
            make.left.equalTo(likeNum.snp.right).offset(WIDTH_DYNAMIC(20))
        }
        commentNum.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(HEIGHT_DYNAMIC(-8))
            make.left.equalTo(comment.snp.right).offset(5)
        }
        
        ImgCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(blogImg.snp.top).offset(20)
            make.left.equalTo(blogImg.snp.left).offset(0)
            make.width.height.equalTo(260)
        }
        
    }
    
    func setTestDatas(){
//        headerImg.image=UIImage(named: "ic_like_sel")
//        name.text="张三"
        relaseDate.text="7月26日"
        deviceType.text="iphone6s"
        tipsValue.text="心情"
        likeNum.text="99"
        commentNum.text="100"
    }
    
    func setTextSize()->CGFloat{
        let text:NSString=NSString(string: blogText.text!)
        let rect=text.boundingRect(with: CGSize(width: WIDTH_DYNAMIC(320-60), height: 4000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)], context: nil)
        blogText.frame.size=rect.size
        return rect.size.height
        
    }
    
    func setImageFrame(_ images:NSArray)->CGSize{
        switch images.count {
        case 0:
            return CGSize.zero
        case 1:
            return CGSize(width: 200, height: 200)
        case 2...3:
            return CGSize(width: 260, height: 100)
        case 4...6:
            return CGSize(width: 260, height: 180)
        case 7...9:
            return CGSize(width: 260, height: 260)
        case 10...100:
            return CGSize(width: 260, height: 260)
        default:
            return CGSize.zero
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView=UIImageView()
        imageView.image=UIImage(named: arrayImages[(indexPath as NSIndexPath).row])
        if arrayImages.count==1{
            imageView.frame.size=CGSize(width: 200, height: 200)
        }
        else {
            imageView.frame.size=CGSize(width: 80, height: 80)
        }
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if arrayImages.count==1{
            return CGSize(width: 200, height: 200)
        }else{
            return CGSize(width: 80, height: 80)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(GameCircleTableViewCell.handleTapGesture))
        tapGesture.numberOfTapsRequired=1
//        blogImg.addGestureRecognizer(tapGesture)
//        blogImg.image=UIImage(named: arrayImages[indexPath.row])
//        blogImg.hidden=false
    }
    
    func handleTapGesture(){
        blogImg.isHidden=true
    }

}

