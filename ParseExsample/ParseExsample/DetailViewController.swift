//
//  DetailViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailsNameLabel: UILabel!
    
    @IBOutlet weak var detailsTypeLabel: UILabel!
    
    
    @IBOutlet weak var detailsAtmospherLabel: UILabel!
    
    
    @IBOutlet weak var detailsMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
