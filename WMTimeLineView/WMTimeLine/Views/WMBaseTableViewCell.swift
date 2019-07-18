//
//  WMBaseTableViewCell.swift
//  WMTimeLineView
//
//  Created by wumeng on 2019/7/18.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
import SnapKit


class WMBaseTableViewCell: UITableViewCell {
    
    var leftView:UIView?
    var upLineView:UIView?
    var middleView:UIView?
    var downLineView:UIView?
    
    
    
    
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
        
      
        
        
        
        
        
    }
    
    //MARK:-
    func updateUpAndDown(_ isHideUplineView:Bool = false,_ isHideDownView:Bool = false) -> Void {
        
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
