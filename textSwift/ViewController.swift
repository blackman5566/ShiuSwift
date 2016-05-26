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
    var ListArray: NSArray = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]
    
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
        cell.testLabel.text = "\(ListArray.objectAtIndex(indexPath.row))";
        
        
        return cell
    }
    
    func tableView(tableView : UITableView, numberOfRowsInSection section : Int)->Int {
        return ListArray.count
    }
}



