//
//  ViewController.swift
//  textSwift
//
//  Created by AllenShiu on 2016/4/14.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var textTableView: UITableView!
    // 你可以在同一行定義定義多個相同行別的變數，並用逗號隔開，最後加上型別標注。
    var ListArray: Array = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]
    var red = 0, green = 0, blue: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil);
        textTableView.registerNib(nib, forCellReuseIdentifier: "TableViewCell")
        textTableView.rowHeight = UITableViewAutomaticDimension
        textTableView.estimatedRowHeight = 60
        
        numberFromString()
        
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
    
    func numberFromString() {
        let stringNumber = "1234"
        let numberFromString = Int(stringNumber)
        if numberFromString != nil {
            print("convertedNumber has an integer value of \(numberFromString!).")
        }
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        ShowJson()
        ShowView()
    }
    
    
    /**
     @abstract 定義傳送的格式
     @discussion 無
     @returns 無
     */
    func ShowJson(){
        let str = "{\"name\":\"James\",\"address\":{\"country\":\"Taiwan\"}}"
        let result = convertStringToDictionary(str) // ["name": "James"]
        ConditionalExpressionDescription(result!)
        print(result!)
    }
    
    /**
     @abstract 使用？與！來做條件式處理
     @discussion 1.用 if 判斷 country 是否有值，如果有值才會往下走 2.使用 ？？來做判斷，比如說 result["address"]?!["city"]! 如果為nil 則會回傳 “我是誰” 字串。
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
        view.test.text = "dwqdqwdqw"
        self.view.addSubview(view)
    }
    
    /**
     @abstract 轉換 Json
     @discussion 將收到的字串轉換成Dictionary
     @returns String to Dictionary
     */
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}



