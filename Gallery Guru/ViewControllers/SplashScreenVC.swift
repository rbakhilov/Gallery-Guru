//
//  SplashScreenVC.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 13.09.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(SplashScreenVC.showNavController), with: nil, afterDelay: 2)
    }
    
    func showNavController() {
        performSegue(withIdentifier: showSplashScreenSegue, sender: self)
    }

}
