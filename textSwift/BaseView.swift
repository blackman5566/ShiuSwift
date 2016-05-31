//
//  BaseView.swift
//  textSwift
//
//  Created by AllenShiu on 2016/5/30.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

import UIKit
class BaseView: UIView {
    
    init() {
        super.init(frame: CGRectZero)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    /**
     @abstract 生成 Nin 畫面
     @discussion 建立一個 BaseView，所有View去繼承它，以動態方式(self.dynamicType)找尋當下使用此方法的Class名稱
     @returns 製造的 新的Nib
     */
    func initNib() -> AnyObject
    {
        let className = String(self.dynamicType).componentsSeparatedByString(".").last!
        let nibView = UINib(nibName:className, bundle: nil).instantiateWithOwner(nil, options: nil)[0];
        return nibView
    }
}
