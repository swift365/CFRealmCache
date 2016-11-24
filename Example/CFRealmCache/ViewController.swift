//
//  ViewController.swift
//  CFRealmCache
//
//  Created by chengfei.heng on 11/24/2016.
//  Copyright (c) 2016 chengfei.heng. All rights reserved.
//

import UIKit
import RealmSwift
import CFRealmCache

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRealm()
        
        // SAVE
        DispatchQueue.main.async {
            NetworkCache.sharedInstance.addOrUpdate("Test 1", value: ["code":0,"message":"return ok"])
        }
        
        // GET
        DispatchQueue.main.async { () -> Void in
            if let cache:MapModel = NetworkCache.sharedInstance.getJsonModel(key: "Test 1") {
                print("\(cache.message)")
            }
        }
    }

    
    func setupRealm(){
        let kRealmSchemaVersion:UInt64 = 0
        print("\(Realm.Configuration.defaultConfiguration.fileURL?.path)")
        //https://realm.io/docs/swift/latest/#installation
        let config = Realm.Configuration(
            schemaVersion:kRealmSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    
                }
        }
        )
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}

