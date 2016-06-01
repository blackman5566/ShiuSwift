//
//  ViewController.swift
//  textSwift
//
//  Created by AllenShiu on 2016/4/14.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, takoButtonProtocol  {
    
    @IBOutlet weak var textTableView: UITableView!
    @IBOutlet weak var label: UILabel!
   // var array  = LightWeightPlist.LWPArray("wdqwd")
    var ListArray: Array = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]
    var red = 0, green = 0, blue: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil);
        textTableView.registerNib(nib, forCellReuseIdentifier: "TableViewCell")
        textTableView.rowHeight = UITableViewAutomaticDimension
        textTableView.estimatedRowHeight = 60
    }
    
    func tableView(tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath)->UITableViewCell {
        
        let simpleTableIdentifier = "TableViewCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.testLabel.text = "\(ListArray[indexPath.row])";
        return cell
    }
    
    func tableView(tableView : UITableView, numberOfRowsInSection section : Int)->Int {
        return ListArray.count
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        ShowJson()
        ShowView()
        ShowClosure()
      //  LightWeightPlist.LWPArray("wdqwd").addObject("1234556677")
       // print(LightWeightPlist.LWPArray("wdqwd"))
//        print(array)
    }
    
    /**
     @abstract 定義傳送的格式
     @discussion 無
     @returns 無
     */
    func ShowJson(){
        let str = "{\"name\":\"James\",\"address\":{\"country\":\"Taiwan\"}}"
        let result = ConvertStringToDictionary(str) // ["name": "James"]
        ConditionalExpressionDescription(result!)
        print(result!)
    }
    
    /**
     @abstract 使用？與！來做條件式處理
     @discussion 1.用 if 判斷 country 是否有值，如果有值才會執行 print 2.使用 ？？來做判斷，比如說 result["address"]?!["city"]! 如果為nil 則會回傳 “我是誰” 字串。
     @returns 無
     */
    func ConditionalExpressionDescription(result:AnyObject) {
        if let name = result["address"]?!["country"]  {
            print(name!) // "James"
        }
        let message = result["address"]?!["city"]! ?? "我是誰"
        print(message)
    }
    
    /**
     @abstract 顯示 view
     @discussion 將要顯示的view 初始化與設定相關參數
     @returns 無
     */
    func ShowView()  {
        let view = testView().initNib() as! testView
        view.frame = CGRectMake(0, 0, 100, 200);
        view.test.text = "測試測試"
        view.delegate = self
        view.closureBlock = {
            print("hello world")
        }
        self.view.addSubview(view)
    }
    
    /**
     @abstract 轉換 Json
     @discussion 將收到的字串轉換成Dictionary
     @returns String to Dictionary
     */
    func ConvertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    /**
     @abstract Swift Closure (Block) 實作
     @discussion 練習將 Closure 實作出來
     @returns
     */
    
    func ShowClosure(){
        repeatMessage(1){
            print("hello world")
        }
        repeatMessage2(3){
            return "第\($0)次說\($1)"
        }
    }
    
    /**
     @abstract Swift Closure (Block) 實作
     @discussion 練習將 Closure 實作出來
     @returns 將 Closure 當作參數實現
     */
    func repeatMessage(count: Int, action: ()->()) {
        for _ in 1...count {
            action()
        }
    }
    
    /**
     @abstract Swift Closure (Block) 實作
     @discussion 練習將 Closure 實作出來
     @returns 將 Closure 當作參數實現2
     */
    func repeatMessage2(count: Int, action: (Int, String) -> String) {
        for i in 1...count {
            action(i, "hello")
        }
    }
    
    //https://hugolu.gitbooks.io/learn-swift/content/Basic/Closure.html
    
    /**
     @abstract Swift delegate 實作
     @discussion 練習將 delegate 實作出來
     @returns 實現兩個協定
     */
    func didTapButton (Message:String){
        self.label.text = Message;
    }
    
    func labelTextOnTakoButton () -> String{
        return "你好"
    }
    
}

private var PERSON_ID_NUMBER_PROPERTY = 0

extension ViewController {
    var idNumber: String {
        get{
            let result = objc_getAssociatedObject(self, &PERSON_ID_NUMBER_PROPERTY) as? String
            if result == nil {
                return "12566"
            }
            return result!
        }
        set{
            objc_setAssociatedObject(self, &PERSON_ID_NUMBER_PROPERTY, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        
    }
}

