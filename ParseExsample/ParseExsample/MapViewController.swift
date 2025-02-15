//
//  MapViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: nil, action: #selector(saveButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: nil, action: #selector(backButtonClicked))
        
    }
    
    @objc func saveButtonClicked() {
        //PARSE
    }
    @objc func backButtonClicked() {
        //kullanılmaz çünkü knedi navigationControllerı var geri gidicek birşeyi yok.
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }

}
