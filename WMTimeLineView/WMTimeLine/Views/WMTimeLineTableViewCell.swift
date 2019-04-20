//
//  WMTimeLineTableViewCell.swift
//  WMTimeLineView
//
//  Created by apple on 2019/4/20.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
import SnapKit

class WMTimeLineTableViewCell: UITableViewCell {
    
    var leftView:UIView?
    var upLineView:UIView?
    var middleView:UIView?
    var downLineView:UIView?
    
    var contentLB:UILabel?
    var timeLB:UILabel?
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-
    func initViews() -> Void {
        self.backgroundColor = UIColor.white;
        self.contentView.backgroundColor = UIColor.white;
        self.selectionStyle = .none;
        
        self.leftView = UIView()
        self.contentView.addSubview(leftView!);
        
        
        self.upLineView = UIView.init();
        self.upLineView?.backgroundColor = UIColor.gray;
        self.leftView?.addSubview(upLineView!);
        
        self.middleView = UIView.init();
        self.middleView?.backgroundColor = UIColor.blue;
        self.middleView?.clipsToBounds = true;
        self.middleView?.layer.cornerRadius = 10;
        self.leftView?.addSubview(middleView!);
        self.middleView?.setContentHuggingPriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        self.middleView?.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        self.middleView?.setContentHuggingPriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.vertical)
        self.middleView?.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.vertical)
        
        self.downLineView = UIView.init();
        self.downLineView?.backgroundColor = UIColor.gray;
        self.leftView?.addSubview(downLineView!);
        
        
        self.contentLB = UILabel();
        contentLB?.textColor = UIColor.black;
        contentLB?.numberOfLines = 0;
        contentLB?.text = "大量放大来伐啦；大；发；大开发考虑到饭局啊"
        self.contentView.addSubview(contentLB!);
        
        
        self.timeLB = UILabel();
        timeLB?.textColor = UIColor.gray;
        timeLB?.text = "1992-09-08 00000";
        self.contentView.addSubview(timeLB!);
        
        self.leftView?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview();
            ConstraintMaker.left.equalToSuperview().offset(15);
            ConstraintMaker.width.equalTo(10);
            ConstraintMaker.bottom.equalToSuperview();
        })
        
        self.upLineView?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview();
            ConstraintMaker.centerX.equalToSuperview().offset(0);
            ConstraintMaker.width.equalTo(4);
            ConstraintMaker.bottom.equalTo((self.middleView?.snp.bottom)!).offset(0)
        })
        self.middleView?.snp.makeConstraints({ (ConstraintMaker) in
//            ConstraintMaker.center.equalToSuperview();
            ConstraintMaker.top.equalToSuperview().offset(15);
            ConstraintMaker.centerX.equalToSuperview();
            ConstraintMaker.height.width.equalTo(20);
        })
        self.downLineView?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.top.equalTo((self.middleView?.snp.bottom)!).offset(0)
            ConstraintMaker.centerX.equalToSuperview().offset(0);
            ConstraintMaker.width.equalTo(4);
            ConstraintMaker.bottom.equalToSuperview();
        })
        
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
        
        self.upLineView?.isHidden = isHideUplineView;
        self.downLineView?.isHidden = isHideDownView;
        
        self.setNeedsLayout();
        self.layoutIfNeeded();
        
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
