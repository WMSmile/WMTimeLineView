//
//  WMCustomTimeLIneModel.swift
//  WMTimeLineView
//
//  Created by apple on 2019/4/20.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class WMCustomTimeLineModel: NSObject ,WMTimeLineModelProtocol{
    
    var timeStr:String?
    var contentStr:String?
    
    convenience init(_ content:String = "",_ time:String = "") {
        self.init()
        self.timeStr = time;
        self.contentStr = content
        
    }
    
    
    
    //MARK:- WMTimeLineModelProtocol
    func wm_getTimeStr() -> String {
        return self.timeStr ?? ""
    }
    
    func wm_getContentStr() -> String {
        return self.contentStr ?? ""
    }

}
