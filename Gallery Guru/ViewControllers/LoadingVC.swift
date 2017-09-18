//
//  LoadingVC.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit
import RealmSwift

class LoadingVC: UIViewController {
    
    let loader = DataLoader()
    let saver = DataSaver()
    var loadingFromDB = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromDB()
        loadFromBE()
    }
    
    private func loadFromDB() -> Void {
        let exhibitionsFromDB = saver.exhibitions
        let exhibitions: [Exhibition]
        if !exhibitionsFromDB.isEmpty {
            loadingFromDB = true
            exhibitions = Array(exhibitionsFromDB)
            showExhibitions(exhibitions)
        }
    }
    
    private func loadFromBE() -> Void {
        loader.loadExhibitions { (exhibitions: [Exhibition]) in
            if !self.loadingFromDB {
                self.showExhibitions(exhibitions)
            }
            exhibitions.forEach {
                self.saver.add($0)
            }
        }
    }
    
    private func showExhibitions(_ exhibitions: [Exhibition]) {
        
        guard let nc = navigationController else {
            fatalError("No Navigator Controler")
        }
        
        guard let exhibitionsVC = storyboard?.instantiateViewController(withIdentifier: "ExhibitionsVC") as? ExhebitionVC else {
            fatalError("No such viewController identifier ExhibitionsVC")
        }
        exhibitionsVC.exhebitions = exhibitions
        nc.setViewControllers([exhibitionsVC], animated: true)
    }
    
}
