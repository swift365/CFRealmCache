//
//  NetworkCache.swift
//  BestBuy
//
//  Created by 衡成飞 on 10/19/16.
//  Copyright © 2016 qianwang. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class NetworkCacheModel: Object {
    dynamic  var key:String = ""
    dynamic  var value:String = ""
    
    override open static func primaryKey() -> String? {
        return "key"
    }
}

open class NetworkCache: Object {
    public class var sharedInstance: NetworkCache {
        struct Static {
            static let instance: NetworkCache = NetworkCache()
        }
        return Static.instance
    }
    
    public func addOrUpdate(_ key:String,value:NSDictionary){
        let s = try? NSString(data:JSONSerialization.data(withJSONObject: value, options: .prettyPrinted), encoding: String.Encoding.utf8.rawValue) as! String
        
        addOrUpdate(key, value: s!)
    }

    private func addOrUpdate(_ key:String,value:String){
        let obj = NetworkCacheModel()
        obj.key = key
        obj.value = value
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(obj, update: true)
        }
    }

    public func getJsonModel<T:Mappable>(key:String) -> T?{
        let realm = try! Realm()
        let result =  realm.object(ofType: NetworkCacheModel.self, forPrimaryKey: key)
       
        if let val = result?.value {
            let m = Mapper<T>().map(JSONString: val)
            return m
        }
 
        return nil
    }
}
