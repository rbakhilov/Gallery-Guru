//
//  LoadingVC.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {
    
    let loader: DataLoader = DataLoader()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadExhibitions { (exhibitions: [Exhibition]) in
            print("exhibitions cout \(exhibitions.count)")
            self.showExhibitions(exhibitions)

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
