//
//  Work.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation

class Work {
    
    let id: String
    let author: String?
    let year: String?
    let imagePicture: String?
    let size: String?
    let title: String?
    let type: String?
    let createdDate: Date?
    let updatedDate: Date?
    
    
    init(id: String, author: String?, year: String?, imagePicture: String?, size: String?, title: String?, type: String?, createdDate: Date?, updatedDate: Date?
        ) {
        self.id = id
        self.author = author
        self.year = year
        self.imagePicture = imagePicture
        self.size = size
        self.title = title
        self.type = type
        self.createdDate = createdDate
        self.updatedDate = updatedDate
    }
}
