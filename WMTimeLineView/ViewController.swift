//
//  ViewController.swift
//  WMTimeLineView
//
//  Created by apple on 2019/4/20.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var listTableView:UITableView?
    let cell_identifer = "WMTimeLineTV"
    var dataList:[WMCustomTimeLineModel] = [];
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.createTableView();
        
        self.initData();
    }

    //MARK:- 创建tableview
    func createTableView() -> Void {
        listTableView = UITableView.init();
        listTableView?.delegate = self;
        listTableView?.dataSource = self;
        self.view.addSubview(listTableView!);
        
        listTableView?.rowHeight = UITableView.automaticDimension;
        listTableView?.estimatedRowHeight = 50;
        listTableView?.register(WMTimeLineTableViewCell.self, forCellReuseIdentifier: cell_identifer);
        listTableView?.separatorStyle = .none;
        
        
        self.listTableView?.backgroundColor = UIColor.lightGray;

        
        self.listTableView?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview();
        })
        
        
    }
    //MARK:- tableview dataSourceDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WMTimeLineTableViewCell = tableView.dequeueReusableCell(withIdentifier: cell_identifer) as! WMTimeLineTableViewCell;
        cell.setDataForViews(self.dataList[indexPath.row],indexPath.row==0,indexPath.row==self.dataList.count-1);

        return cell;
    }
    
    //MARK:- tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了！。。。。。")
    }


    
    
    //MARK:- 
    func initData() -> Void {
        
        self.dataList = [
            WMCustomTimeLineModel.init("[北京通州区杨庄公司锦园服务部]快件已被27号楼e站代签收", "2017-07-04 12:59:00"),
            WMCustomTimeLineModel.init("[北京通州区杨庄公司]到达目的地网店，快件将很快进行派送", "2017-07-04 12:59:00"),
            WMCustomTimeLineModel.init("[北京通州区杨庄公司]进行派件扫描；派送业务员：周**；联系电话：1352****6", "2017-07-04 12:59:00"),
            WMCustomTimeLineModel.init("[北京分拨中心]在分拨中心进行卸车扫描", "2017-07-04 12:59:00"),
            WMCustomTimeLineModel.init("[浙江杭州分拨中心]在分拨中心进行称重扫描", "2017-07-04 12:59:00"),
            WMCustomTimeLineModel.init("[浙江杭州下城区三里亭公司]进行揽件扫描", "2017-07-04 12:59:00")
        ]
        
        self.listTableView?.reloadData();
    
    }

    

    
    
    
    
    
    
}

