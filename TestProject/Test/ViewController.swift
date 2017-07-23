//
//  ViewController.swift
//  Test
//
//  Created by popcool on 2017/7/21.
//  Copyright © 2017年 Arwin Tsai. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArray = [String]()
    var reloadDataDic = Dictionary<String, String>()
    var reloadCount = 0
    var isBotton = false
    var lastPosition:CGFloat!
    var direction:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView.alwaysBounceVertical = true
//        self.delegateCell = CollectionCellDelegate.self as! CollectionCellDelegate
        
        self.lastPosition = 0
        
        let layout = UICollectionViewFlowLayout()
        //        layout.minimumInteritemSpacing = 1
        //        layout.minimumLineSpacing = 1
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20,                                    bottom: 20, right: 20)
        
        //         Do any additional setup after loading the view.
        self.collectionView.collectionViewLayout = layout
        
        createData()
        refreshData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let width = (Double(UIScreen.main.bounds.size.width) - 80)/2
        let height = (Double(UIScreen.main.bounds.size.height) - 160 - 40)/5
        
        cell.subView = UIView(frame: CGRect(x: 0, y: 20, width: width, height: height))
        cell.subView.backgroundColor = UIColor.blue
        cell.subView.layer.cornerRadius = 12.0
        cell.subView.layer.masksToBounds = false
        cell.subView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.subView.layer.shadowOpacity = 0.5
        cell.subView.layer.shadowColor = UIColor.black.cgColor
        cell.subView.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.subView.layer.shouldRasterize = true
        cell.subView.layer.rasterizationScale = UIScreen.main.scale
        
        cell.titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: width, height: 40))
        cell.titleLabel.textAlignment = .center
        cell.titleLabel.textColor = UIColor.orange
        cell.titleLabel.backgroundColor = UIColor.darkGray
        cell.titleLabel.layer.cornerRadius = 12.0
        cell.titleLabel.clipsToBounds = true
        
        cell.textLabel = UILabel(frame:CGRect(x: 0, y: 40, width: width, height: height - 40))
        cell.textLabel.textAlignment = .center
        cell.textLabel.textColor = UIColor.darkText
        cell.textLabel.backgroundColor = UIColor.green
        cell.textLabel.layer.cornerRadius = 12.0
        cell.textLabel.clipsToBounds = true

        
        cell.titleLabel.text = reloadDataDic["title"]
        cell.textLabel.text = reloadDataDic["text"]
        
//        // 建立一個空白item，目的是用來觸發下拉到底的function
//        if indexPath.section == 5 {
//            cell.subView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
//            cell.subView.backgroundColor = UIColor.white
//            cell.titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: width, height: 0))
//            cell.titleLabel.textAlignment = .center
//            cell.titleLabel.textColor = UIColor.white
//            cell.titleLabel.backgroundColor = UIColor.white
//        }
        
        cell.subView.addSubview(cell.titleLabel)
        cell.subView.addSubview(cell.textLabel)
        cell.addSubview(cell.subView)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (Double(UIScreen.main.bounds.size.width) - 80)/2
        let height = (Double(UIScreen.main.bounds.size.height) - 160 - 40)/5
        
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
//
//        let a = scrollView.contentSize.height
        
//        if (scrollView.bounds.size.height + scrollView.contentOffset.y)>scrollView.contentSize.height {
        if bottomEdge >= scrollView.contentSize.height{
        
            if isBotton == false {
                isBotton = true
                getBottom()
            }
        }
        
        if lastPosition > scrollView.contentOffset.y {
            direction = "Up"
        } else {
            direction = "down"
        }

        
        lastPosition = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // 向上滑動
        if direction == "Up" {
            isBotton = false
        }
    }
    
    func getBottom() {
        
        reloadCount += 1
        refreshData()
        self.collectionView.reloadData()
        
    }
    
    func createData() {
        
        for i in 1...10 {
            dataArray.append("Page" + String(i))
        }
    }
    
    func refreshData() {
        
        if reloadCount == 10 {
            reloadCount = 0
        }
        
        reloadDataDic = ["title" : dataArray[reloadCount] + "_title",
                      "text" : dataArray[reloadCount] + "_text"]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
