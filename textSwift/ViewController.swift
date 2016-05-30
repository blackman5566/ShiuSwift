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
        ListArray.append("新來的")
        ListArray.insert("我是第一個", atIndex: 0)
        numberFromString()
        
    }
    func tableView(tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath)->UITableViewCell {
        
        let simpleTableIdentifier = "TableViewCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.testLabel.text = "\(ListArray[indexPath.row])";
        //        print("\(ListArray.objectAtIndex(indexPath.row))")
        //        print("The current value of friendlyWelcome is \(cell.testLabel.text)")
        return cell
    }
    
    func tableView(tableView : UITableView, numberOfRowsInSection section : Int)->Int {
        return ListArray.count
    }
    
    /*
     @abstract 使用optionals來處理值可能不存在的情況。optionals 型別表示：有值，等於 x  或者 沒有值
     @discussion 因為toInt方法可能會失敗，所以它回傳一個optional Int，而不是一個Int。一個 optional Int被寫作Int?而不是Int。問號暗示包
     含的值是 optional 型別，也就是說可能包含Int值也可能不包含值。（不能包含其他任何值比如Bool值或者String值。只能是Int或者什麼都沒有。）
     @param completion callback 有值回傳 Optional(1234), 沒有值回傳 nil
     */
    func numberFromString() {
        let stringNumber = "1234"
        let numberFromString = Int(stringNumber)
        
        /*
         @abstract 可以使用if語句透過對比nil的方式來判斷一個 optional 是否包含值。使用「等於」運算子（==）或是「不等於」運算子(!=)來執行      
         這樣的比較
         @discussion 當你確定 optional 確實包含值之後，你可以在 optional 的名字後面加一個感嘆號（!）來獲取值。這個驚嘆號表示「我知道這個 
         optional 有值，請使用它。」這被稱為 optional 值的強制解析（forced unwrapping）
         @param completion callback numberFromString! = 1234
         */
        if numberFromString != nil {
            print("convertedNumber has an integer value of \(numberFromString!).")
        }
        
        
        
    }
    @IBAction func buttonAction(sender: AnyObject) {
        //let possibleString: String? = "我是一"
        // ?? (Nil Coalescing Operator) 這個語法來簡化 Unwrapping 的過程。 他的規則是，如果 ?? 左邊有值，就取左邊原本的值，如果左邊是一個 nil ，那就改取右邊的值。
        //        let possible = possibleString ?? "qwdqwd"
        //        print(possible)
        
        //let assumedString: String! = "An implicitly unwrapped optional string."
        //print(assumedString)  // 不需要感嘆號
        // 輸出 "An implicitly unwrapped optional string."
        
        
        
        
        
        
        let str = "{\"name\":\"James\",\"address\":{\"country\":\"Taiwan\"}}"
                let result = convertStringToDictionary(str) // ["name": "James"]
        //        if let name = result?["address"]?["country"]!  {
        //            print(name) // "James"
        //        }
        //        let name1 = result?["address"]?["city"]! ?? "我是誰"
        //        print(name1!)
        
        for index in 1...50 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        for i in 0..<ListArray.count {
            print("第 \(i + 1) 個人叫 \(ListArray[i])")
        }
        
        for (airportCode, airportName) in result! {
            print("\(airportCode): \(airportName)")
        }
        // 1 * 5 = 5
        // 2 * 5 = 10
        // 3 * 5 = 15
        // 4 * 5 = 20
        // 5 * 5 = 25
        
        //        let dog: String = "1111"
        //        let cow: String = "wqddwq"
        //        let dogCow = dog + cow
        //        print("\(dogCow)")
        // dogCow 現在是 "🐶🐮"
    }
    
    
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



