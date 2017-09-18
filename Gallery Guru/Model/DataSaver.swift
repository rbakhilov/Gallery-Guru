//
//  DataSaver.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 17.09.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.

import Foundation
import RealmSwift

class DataSaver {
    
    var exhibitions: Results<Exhibition>
    private var token: NotificationToken?
    
    init() {
        let realm = try! Realm()
        exhibitions = realm.objects(Exhibition.self)
    }
    
    func add(_ exhibition: Exhibition) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(exhibition, update: true)
        }
    }
    
    func subscribeOnChanges() {
        self.token = exhibitions.addNotificationBlock { (_) in
            self.sendNotificationAboutUpdateModel()
        }
    }
    
    private func sendNotificationAboutUpdateModel() {
        NotificationCenter.default.post(name: exhibitionUpdateNotificationName,
                                        object: nil)
    }

}
