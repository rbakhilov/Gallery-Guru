//
//  Gallery.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation

class Gallery {
    
    let id: String
    let name: String
    let createdDate: Date?
    let updatedDate: Date?
    let galleryDescription: String?
    let email: String?
    let facebook: String?
    let city: String?
    let schedule: [String]?
    let address: String?
    let logo: [String: String]?
    let link: String?
    let phone: String?
    let latitude: String?
    let longitude: String?
    
    init(id: String, name: String, createdDate: Date?, updatedDate: Date?, galleryDescription: String?, email: String?, facebook: String?, city: String?, schedule: [String]?, address: String?, logo: [String: String]?, link: String?, phone: String?, latitude: String?, longitude: String?) {
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.galleryDescription = galleryDescription
        self.email = email
        self.facebook = facebook
        self.city = city
        self.schedule = schedule
        self.address = address
        self.logo = logo
        self.link = link
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
    }
}
