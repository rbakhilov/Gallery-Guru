//
//  LoginVC.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var slidePageControl: UIPageControl!
    
    var slides = [#imageLiteral(resourceName: "Slide 1"), #imageLiteral(resourceName: "Slide 2"), #imageLiteral(resourceName: "Slide 3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
}

extension LoginVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let indexPage = collectionView.contentOffset.x / collectionView.frame.width
        self.slidePageControl.currentPage = Int(indexPage)
    }
}

extension LoginVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}

extension LoginVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideViewCell", for: indexPath) as! SlideViewCell
        cell.slide.image = slides[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.slidePageControl.currentPage = indexPath.row
    }
    
}
