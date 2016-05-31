//
//  testView.swift
//  textSwift
//
//  Created by AllenShiu on 2016/5/30.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

import UIKit

class testView: BaseView {
    @IBOutlet weak var test: UILabel!
    var closureBlock:(()->())?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBAction func buttonAction(sender: AnyObject) {
        if closureBlock != nil {
         self.closureBlock!()
        }
    }
    
}