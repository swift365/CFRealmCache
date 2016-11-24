//
//  MapModel.swift
//  CFRealmCache
//
//  Created by 衡成飞 on 11/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import ObjectMapper

open class MapModel: Mappable {
    
    open var code:Int?
    open var message:String?
    
    public init(){
        
    }
    
    required public init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}
