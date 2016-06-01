////
////  LightWeightPlist.swift
////  textSwift
////
////  Created by AllenShiu on 2016/5/31.
////  Copyright © 2016年 AllenShiu. All rights reserved.
////
//
//import UIKit
//var AssociatedArrayHandle: UInt8 = 0
//var AssociatedCacheHandle: UInt8 = 1
//var AssociatedLightHandle: UInt8 = 2
//class LightWeightPlist: NSObject,NSCacheDelegate {
//    var instanceShare:LightWeightPlist
//    class func initShare() -> LightWeightPlist{
//        var token : dispatch_once_t = 0
//        dispatch_once(&token) {
//            instanceShare = LightWeightPlist()
//        }
//        return instanceShare
//    }
//    
//    class func cache(cache: NSCache, willEvictObject obj: AnyObject){
//        
//    }
//    
//    class func LWPArray(key:String) -> NSMutableArray{
//        return self.initShare().LWPArray(key)
//    }
//    
//    func LWPArray(key:String) -> NSMutableArray{
//        var token : dispatch_once_t = 0
//        let objects1:NSMutableArray
//        dispatch_once(&token) {
//            objects1 = NSMutableArray()
//        }
//        return objects1;
//    }
//}
////        if objc_getAssociatedObject(self, &AssociatedArrayHandle) == nil {
////            objc_setAssociatedObject(self, &AssociatedArrayHandle, NSMutableArray(), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
////        }
////        return objc_getAssociatedObject(self,&AssociatedArrayHandle) as! NSMutableArray
//
////extension LightWeightPlist {
////    class func objectFromCache(key:String)   -> AnyObject {
////        return objc_getAssociatedObject(self, lwpBridge(self.objects().dataCache.objectForKey(key)));
////    }
////}
//
////extension LightWeightPlist {
////    class func objects() -> LightWeightPlistObjects{
////        var token : dispatch_once_t = 0
////        dispatch_once(&token) {
////            let objects = LightWeightPlistObjects();
////            objects.dataCache.delegate = self.initShare()
////            objc_setAssociatedObject(self, &AssociatedCacheHandle, objects, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
////            
////        }
////        return objc_getAssociatedObject(self, &AssociatedCacheHandle) as! LightWeightPlistObjects
////    }
////}
//
//class LightWeightPlistObjects: NSObject {
//    var dataCache:NSCache
//    var pointerMapping:NSMutableDictionary
//    override init() {
//        self.dataCache = NSCache();
//        self.pointerMapping = NSMutableDictionary();
//    }
//}
