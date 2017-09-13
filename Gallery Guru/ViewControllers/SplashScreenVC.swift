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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
