//
//  DataLoader.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation
import Alamofire

class DataLoader {
    
    typealias LoadExhibitionHandler = (_ exhibitions: [Exhibition]) -> Void
    
    func loadExhibitions(handler: @escaping LoadExhibitionHandler) {
        
        Alamofire.request(exhibitionsURL).responseJSON { response in
            
            if let exhibitionsRawArray = response.result.value as? [[String: Any]] {
                let exhibitions: [Exhibition] = exhibitionsRawArray.map {
                    
                    
                    let galleryRaw = $0["gallery"] as? [String: Any]
                    let worksRaw = $0["works"] as? [[String: Any]]
                    
                    var gallery: Gallery? = nil
                    var works: [Work] = []
                    
                    if let worksRaw = worksRaw {
                        works = worksRaw.map {
                            
                            let imagePictureRaw = $0["imgPicture"] as? [String: Any]
                            var imagePicture: String = ""
                            if let imagePictureRaw = imagePictureRaw {
                                imagePicture = imagePictureRaw["name"] as! String
                            }
                            
                            let work = Work(id: $0["objectId"] as! String,
                                        author: $0["author"] as? String,
                                        year: $0["year"] as? String,
                                        imagePicture: imagePicture,
                                        size: $0["size"] as? String,
                                        title: $0["title"] as? String,
                                        type: $0["type"] as? String,
                                        createdDate: Date.from(dateString: $0["_created_at"] as? String),
                                        updatedDate: Date.from(dateString: $0["_updated_at"] as? String))
                            return work

                        }
                    }
                    
                    if let galleryRaw = galleryRaw {
                        gallery = Gallery(id: galleryRaw["objectId"] as! String,
                                          name: galleryRaw["name"] as! String,
                                          createdDate: Date.from(dateString: galleryRaw["created_at"] as? String),
                                          updatedDate: Date.from(dateString: galleryRaw["updated_at"] as? String),
                                          galleryDescription: galleryRaw["galleryDescription"] as? String,
                                          email: galleryRaw["email"] as? String,
                                          facebook: galleryRaw["facebook"] as? String,
                                          city: galleryRaw["city"] as? String,
                                          schedule: galleryRaw["schedule"] as? [String],
                                          address: galleryRaw["address"] as? String,
                                          logo: galleryRaw["galleryLogo"] as? [String: String],
                                          link: galleryRaw["link"] as? String,
                                          phone: galleryRaw["phone"] as? String,
                                          latitude: galleryRaw["latitude"] as? String,
                                          longitude: galleryRaw["longitude"] as? String)
                    }
                    
                    
                    return Exhibition(id: $0["objectId"] as! String,
                                      authorName: $0["authorName"] as? String,
                                      gallery: gallery,
                                      name: $0["name"] as! String,
                                      authorDescription: $0["authorDescription"] as? String,
                                      dateStart: Date.from(dateString: $0["dateStart"] as? String),
                                      about: $0["about"] as? String,
                                      dateEnd: Date.from(dateString: $0["dateEnd"] as? String),
                                      works: works,
                                      likesCount: $0["likesCount"] as? Int ?? 0)
                }
                handler(exhibitions)
            }
        }
    }
    
    
}
