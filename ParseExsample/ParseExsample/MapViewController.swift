//
//  MapViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit
import MapKit
import ParseSwift

class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: nil, action: #selector(saveButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: nil, action: #selector(backButtonClicked))
        
        self.mapView.delegate = self
        self.locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(recognizer)
        
    }
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let  touche = gestureRecognizer.location(in: self.mapView)
            let coordinate = self.mapView.convert(touche, toCoordinateFrom: self.mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = PlaceModel.sharedIntance.placeName
            annotation.subtitle = PlaceModel.sharedIntance.placeType
            self.mapView.addAnnotation(annotation)
            PlaceModel.sharedIntance.placeLatitude = String(coordinate.latitude)
            PlaceModel.sharedIntance.placeLongitude = String(coordinate.longitude)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocation(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    @objc func saveButtonClicked() {
        print("save butonuna tıklandı")
        //PARSE
        let placeModel = PlaceModel.sharedIntance
        var placesObject = Places()
        placesObject.name = placeModel.placeName
        placesObject.type = placeModel.placeType
        placesObject.atmosphere = placeModel.placeAtmosphere
        placesObject.latitude = placeModel.placeLatitude
        placesObject.longitude = placeModel.placeLongitude
        guard let imageData = placeModel.placeImageUrl.jpegData(compressionQuality: 0.8) else {
               print("Görseli dönüştürme hatası")
               return
           }
           
           let parseFile = ParseFile(name: "image.jpg", data: imageData)
        placesObject.imageFile = parseFile
        

        placesObject.save { result in
            switch result {
            case .success(let savedPlaces):
                print("Başarıyla kaydedildi: \(savedPlaces)")
                self.performSegue(withIdentifier: "fromMapVCtoPlacesVC", sender: nil)
            case .failure(let error):
                print("Hata oluştu: \(error.localizedDescription)")
                self.makeAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    @objc func backButtonClicked() {
        //kullanılmaz çünkü knedi navigationControllerı var geri gidicek birşeyi yok.
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
   func makeAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
    }

}
