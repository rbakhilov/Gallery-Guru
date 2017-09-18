//
//  DataLoader.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class DataLoader {
    
    typealias LoadExhibitionHandler = (_ exhibitions: [Exhibition]) -> Void
    
    func loadExhibitions(handler: @escaping LoadExhibitionHandler) {
        
        Alamofire.request(exhibitionsURL).responseJSON { response in
            
            if let exhibitionsRawArray = response.result.value as? [[String: Any]] {
                let exhibitions: [Exhibition] = exhibitionsRawArray.map {
                    
                    
                    let galleryRaw = $0["gallery"] as? [String: Any]
                    let worksRaw = $0["works"] as? [[String: Any]]
                    
                    var gallery: Gallery? = nil
                    let works: List<Work> = List()
                    
                    if let worksRaw = worksRaw {
                        worksRaw.forEach {
                            let imagePictureRaw = $0["imgPicture"] as? [String: Any]
                            var imagePicture: String = ""
                            if let imagePictureRaw = imagePictureRaw {
                                imagePicture = imagePictureRaw["name"] as! String
                            }
                            
                            let work = Work()
                            work.id = $0["objectId"] as! String
                            work.author = $0["author"] as? String
                            work.year = $0["year"] as? String
                            work.imagePicture = imagePicture
                            work.size = $0["size"] as? String
                            work.title = $0["title"] as? String
                            work.type = $0["type"] as? String
                            
                            works.append(work)
                            
                        }
                    }
                    
                    if let galleryRaw = galleryRaw {
                        gallery = Gallery()
                        gallery?.id = galleryRaw["objectId"] as! String
                        gallery?.name = galleryRaw["name"] as! String
                        gallery?.galleryDescription = galleryRaw["galleryDescription"] as? String
                        gallery?.email = galleryRaw["email"] as? String
                        gallery?.facebook = galleryRaw["facebook"] as? String
                        gallery?.city = galleryRaw["city"] as? String
                        let scheduleRaw = galleryRaw["schedule"] as? [Any]
                        if let scheduleRaw = scheduleRaw {
                            if let schedule0 = scheduleRaw[0] as? String {
                                gallery?.schedule0 = schedule0
                            }
                            if let schedule1 = scheduleRaw[1] as? String {
                                gallery?.schedule1 = schedule1
                            }
                        }
                        gallery?.address = galleryRaw["address"] as? String
                        if let galleryLogoRaw = galleryRaw["galleryLogo"] as? [String: Any] {
                            gallery?.logo = galleryLogoRaw["name"] as? String
                        }
                        gallery?.link = galleryRaw["link"] as? String
                        gallery?.phone = galleryRaw["phone"] as? String
                        gallery?.latitude = galleryRaw["latitude"] as? String
                        gallery?.longitude = galleryRaw["longitude"] as? String
                    }
                    
                    
                    let exhibition = Exhibition()
                    exhibition.id = $0["objectId"] as! String
                    exhibition.authorName = $0["authorName"] as? String
                    exhibition.gallery = gallery
                    exhibition.name = $0["name"] as! String
                    exhibition.authorDescription = $0["authorDescription"] as? String
                    let rawDateStart = $0["dateStart"] as? [String: Any]
                    if let rawDateStart = rawDateStart {
                        exhibition.dateStart = Date.from(dateString: rawDateStart["iso"] as? String)
                    }
                    let rawDateEnd = $0["dateEnd"] as? [String: Any]
                    if let rawDateEnd = rawDateEnd{
                        exhibition.dateEnd = Date.from(dateString: rawDateEnd["iso"] as? String)
                    }
                    exhibition.about = $0["about"] as? String
                    exhibition.works = works
                    let rawLikesCount = $0["likesCount"] as? Int
                    if let likesCount = rawLikesCount {
                        exhibition.likesCount = RealmOptional(likesCount)
                    }
                    return exhibition
                }
                handler(exhibitions)
            }
        }
    }
    
}
