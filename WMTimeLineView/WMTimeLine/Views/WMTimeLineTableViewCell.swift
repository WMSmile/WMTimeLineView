//
//  WMTimeLineTableViewCell.swift
//  WMTimeLineView
//
//  Created by apple on 2019/4/20.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
import SnapKit

class WMTimeLineTableViewCell: WMBaseTableViewCell {
    
    
    var contentLB:UILabel?
    var timeLB:UILabel?
    
    
    
    
    
    //MARK:-
    override func initViews() -> Void {
        super.initViews()
        
      
        
        
        self.contentLB = UILabel();
        contentLB?.textColor = UIColor.black;
        contentLB?.numberOfLines = 0;
        contentLB?.text = "大量放大来伐啦；大；发；大开发考虑到饭局啊"
        self.contentView.addSubview(contentLB!);
        
        
        self.timeLB = UILabel();
        timeLB?.textColor = UIColor.gray;
        timeLB?.text = "1992-09-08 00000";
        self.contentView.addSubview(timeLB!);
        
        
        
        self.contentLB?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(15);
            ConstraintMaker.left.equalTo((self.leftView?.snp.right)!).offset(10);
            ConstraintMaker.right.equalToSuperview().offset(-15)
        })
        self.timeLB?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.top.equalTo((self.contentLB?.snp.bottom)!).offset(10);
            ConstraintMaker.left.equalTo(self.contentLB!).offset(0);
            ConstraintMaker.bottom.equalToSuperview().offset(-15);
            ConstraintMaker.right.equalToSuperview().offset(-15)


        })
        
        
        
        
        
        
    }
    
    //MARK:-
    func setDataForViews(_ model:WMTimeLineModelProtocol,_ isHideUplineView:Bool = false,_ isHideDownView:Bool = false) -> Void {
        self.contentLB?.text = model.wm_getContentStr();
        self.timeLB?.text = model.wm_getTimeStr();
        
        self.updateUpAndDown(isHideUplineView, isHideDownView)
        
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
