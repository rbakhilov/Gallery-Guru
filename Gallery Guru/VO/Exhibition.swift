//
//  Exhibition.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation
import RealmSwift

class Exhibition: Object {
    
    dynamic var id: String = ""
    dynamic var authorName: String? = ""
    dynamic var gallery: Gallery? = nil
    dynamic var name: String = ""
    dynamic var authorDescription: String? = ""
    dynamic var dateStart: Date? = nil
    dynamic var about: String? = ""
    dynamic var dateEnd: Date? = nil
    var works: List<Work> = List()
    var likesCount = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

