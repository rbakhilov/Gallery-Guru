//
//  Work.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation
import RealmSwift

class Work: Object {
    
    dynamic var id: String = ""
    dynamic var author: String? = ""
    dynamic var year: String? = ""
    dynamic var imagePicture: String? = ""
    dynamic var size: String? = ""
    dynamic var title: String? = ""
    dynamic var type: String? = ""


}
