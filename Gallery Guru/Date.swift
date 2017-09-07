//
//  Date.swift
//  Gallery Guru
//
//  Created by Роман on 30.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation

extension Date {
    
    static func from(dateString: String?) -> Date? {
        guard let dateString = dateString else{
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        
        return dateFormatter.date(from: dateString)
    }
    
}
