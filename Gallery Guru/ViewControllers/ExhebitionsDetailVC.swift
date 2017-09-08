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
    
    weak var detailExhebition: Exhibition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetailExhebition()
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.backItem?.title = ""
    }
    
    lazy var dateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd.MM.yyyy"
        return dateFormat
    }()
    
    func loadDetailExhebition() {
        if let detailExhebition = detailExhebition {
            galleryNameLabel.text = detailExhebition.gallery?.name
            exhibitionLabel.text = detailExhebition.name
            exhibitionAuthorName.text = detailExhebition.authorName
            startDateLabel.text = detailExhebition.gallery?.schedule?[0]
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
