//
//  ExhebitionVC.swift
//  Gallery Guru
//
//  Created by Roman Bakhilov on 12.08.17.
//  Copyright © 2017 Roman Bakhilov. All rights reserved.
//

import UIKit

class ExhebitionVC: UIViewController {

    @IBOutlet weak var exhebitionTableview: UITableView!
    
    var exhebitions: [Exhibition] = []
    var detailExhebition: Exhibition?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exhebitionTableview.delegate = self
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexCell = exhebitionTableview.indexPathForSelectedRow {
            exhebitionTableview.deselectRow(at: indexCell, animated: true)
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == exhebitionDetail {
            let nextVC = segue.destination as! ExhebitionsDetailVC
            nextVC.detailExhebition = detailExhebition
        }
    }
    
    func configureTableView() {
        exhebitionTableview.rowHeight = UITableViewAutomaticDimension
        exhebitionTableview.estimatedRowHeight = 320
        exhebitionTableview.register(UINib.init(nibName: exhibitionsCell, bundle: nil), forCellReuseIdentifier: exhibitionsCell)
    }

}

extension ExhebitionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhebitions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: exhibitionsCell) as! ExhibitionsCell
        let exhebition = exhebitions[indexPath.row]
        
        if !exhebition.works.isEmpty {
            let imageName = exhebition.works[0].imagePicture
            cell.exhibitionImage.image = UIImage(named: imageName!)
        }
        
        cell.exhibitionName.text = exhebition.name
        cell.authorName.text = exhebition.authorName
        cell.galleryName.text = exhebition.gallery?.name
        return cell
        
    }
    
}

extension ExhebitionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailExhebition = exhebitions[indexPath.row]
        performSegue(withIdentifier: exhebitionDetail, sender: nil)
    }
    
}


