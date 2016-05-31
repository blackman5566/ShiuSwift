//
//  testView.swift
//  textSwift
//
//  Created by AllenShiu on 2016/5/30.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

import UIKit
// MARK: Init View Protocol
protocol takoButtonProtocol {
    func didTapButton (Message:String)
    func labelTextOnTakoButton () -> String
}

class testView: BaseView {
    @IBOutlet weak var test: UILabel!
    var delegate:takoButtonProtocol?
    
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
        // delegate action 
        self.delegate!.didTapButton("delegate 設定")
        self.test.text = self.delegate!.labelTextOnTakoButton()
        }
    }
    
}