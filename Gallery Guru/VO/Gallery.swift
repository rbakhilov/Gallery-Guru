//
//  Gallery.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation
import RealmSwift

class Gallery: Object {
    
    dynamic var  id: String = ""
    dynamic var  name: String = ""
    dynamic var  galleryDescription: String? = ""
    dynamic var  email: String? = ""
    dynamic var  facebook: String? = ""
    dynamic var  city: String? = ""
    dynamic var  schedule0: String? = ""
    dynamic var  schedule1: String? = ""
    dynamic var  address: String? = ""
    dynamic var  logo: String? = ""
    dynamic var  link: String? = ""
    dynamic var  phone: String? = ""
    dynamic var  latitude: String? = ""
    dynamic var  longitude: String? = ""

}
