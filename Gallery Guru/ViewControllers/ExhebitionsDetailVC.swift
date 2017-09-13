//
//  ExhebitionsDetailVC.swift
//  Gallery Guru
//
//  Created by Роман on 05.09.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit

class ExhebitionsDetailVC: UIViewController {

    @IBOutlet weak var galleryNameLabel: UILabel!
    @IBOutlet weak var exhibitionLabel: UILabel!
    @IBOutlet weak var exhibitionAuthorName: UILabel!
    @IBOutlet weak var startMinusDateLabel: UILabel!
    @IBOutlet weak var galleyLogoLabel: UIImageView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var galleryPhoneTextView: UITextView!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var gallerySiteTextView: UITextView!
    @IBOutlet weak var galleryFacebookTextView: UITextView!
    @IBOutlet weak var authorDescriptionTextView: UITextView!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var authorDescriptionView: UIView!
    @IBOutlet weak var exhibitionContactsView: UIView!
    @IBOutlet weak var detailButtonView: UIView!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var worksCollectionView: UICollectionView!
    
    weak var detailExhebition: Exhibition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        worksCollectionView.dataSource = self
        
        loadDetailExhebition()
        hideExhibitionDetail()
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.backItem?.title = ""
    }
    
    @IBAction func visibilitySwitchExhebitionContact(_ sender: Any) {
        
        var rotationAngel: CGFloat = 0
        
        if exhibitionContactsView.isHidden {
            rotationAngel = CGFloat.pi
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.detailButton.transform = CGAffineTransform(rotationAngle: rotationAngel)
            self.exhibitionContactsView.isHidden = !self.exhibitionContactsView.isHidden
            self.authorDescriptionView.isHidden = !self.authorDescriptionView.isHidden
        })
        
    }
    
    lazy var dateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd.MM.yyyy"
        return dateFormat
    }()
    
    func hideExhibitionDetail() {
        exhibitionContactsView.isHidden = true
        authorDescriptionView.isHidden = true
    }
    
    func loadDetailExhebition() {
        if let detailExhebition = detailExhebition {
            galleryNameLabel.text = detailExhebition.gallery?.name
            exhibitionLabel.text = detailExhebition.name
            exhibitionAuthorName.text = detailExhebition.authorName

            if let tempDateStart = detailExhebition.dateStart,
                let tempDateEnd = detailExhebition.dateEnd {
                let dateStart = dateFormat.string(from: tempDateStart)
                let dateEnd = dateFormat.string(from: tempDateEnd)
                startMinusDateLabel.text = dateStart + " - " + dateEnd
            }
            
            startDateLabel.text = detailExhebition.gallery?.schedule?[0]
            galleyLogoLabel.image = UIImage(named: (detailExhebition.gallery?.logo?["name"])!)
            endDateLabel.text = detailExhebition.gallery?.schedule?[1]
            addressTextView.text = detailExhebition.gallery?.address
            galleryPhoneTextView.text = detailExhebition.gallery?.phone
            gallerySiteTextView.text = detailExhebition.gallery?.link
            galleryFacebookTextView.text = detailExhebition.gallery?.facebook
            authorDescriptionTextView.text = detailExhebition.authorDescription
            aboutTextView.text = detailExhebition.about
        }
    }
}

extension ExhebitionsDetailVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let detailExhebition = detailExhebition {
            return detailExhebition.works.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: worksCollectionViewCell, for: indexPath) as! WorksCollectionViewCell
        var works: [Work] = []
        if let detailExhebition = detailExhebition {
            works = Array(detailExhebition.works)
        }
        cell.worksImage.image = UIImage(named: works[indexPath.row].imagePicture!)
        return cell
    }
}
