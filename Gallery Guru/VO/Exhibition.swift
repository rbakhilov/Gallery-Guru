//
//  Exhibition.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation

class Exhibition {
    
    let id: String
    let authorName: String?
    let gallery: Gallery?
    let name: String
    var authorDescription: String?
    let dateStart: Date?
    var about: String?
    let dateEnd: Date?
    let works: [Work]
    let likesCount: Int
    
    init(id: String, authorName: String?, gallery: Gallery? = nil, name: String,
        authorDescription: String? = nil, dateStart: Date?, about: String?,
        dateEnd: Date?, works: [Work] = [], likesCount: Int = 0) {
        self.id = id
        self.authorName = authorName
        self.gallery = gallery
        self.name = name
        self.authorDescription = authorDescription
        self.dateStart = dateStart
        self.about = about
        self.dateEnd = dateEnd
        self.works = works
        self.likesCount = likesCount
    }
    
}
