//
//  DetailViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit
import MapKit
import ParseSwift

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailsNameLabel: UILabel!
    
    @IBOutlet weak var detailsTypeLabel: UILabel!
    
    
    @IBOutlet weak var detailsAtmospherLabel: UILabel!
    
    
    @IBOutlet weak var detailsMapView: MKMapView!
    
    var choosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromParse()
        detailsMapView.delegate = self

      


    }
    func getDataFromParse() {
        let query = Places.query()
        query.find { result in
            switch result {
            case .success(let place):
                for places in place {
                    if let placeName = places.name
                    {
                    self.detailsNameLabel.text = placeName
                    }
                    if let placeType = places.type {
                                              self.detailsTypeLabel.text = placeType
                                          }
                                          
                    if let placeAtmosphere = places.atmosphere {
                        self.detailsAtmospherLabel.text = placeAtmosphere
                                          }
                                          
                    if let placeLatitude = places.latitude {
                                              if let placeLatitudeDouble = Double(placeLatitude) {
                                                  self.chosenLatitude = placeLatitudeDouble
                                              }
                                          }
                    if let placeLongitude = places.longitude {
                                                if let placeLongitudeDouble = Double(placeLongitude) {
                                                    self.chosenLongitude = placeLongitudeDouble
                                                }
                                            }
                                            
                 
                 
                                                
                    
                    
                    // MAPS
                                           
                                           let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                                           
                                           let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
                                           
                                           let region = MKCoordinateRegion(center: location, span: span)
                                           
                                           self.detailsMapView.setRegion(region, animated: true)
                                           
                                           let annotation = MKPointAnnotation()
                                           annotation.coordinate = location
                                           annotation.title = self.detailsNameLabel.text!
                                           annotation.subtitle = self.detailsTypeLabel.text!
                                           self.detailsMapView.addAnnotation(annotation)
                    
                }
            case .failure(let error):
                print("Hata oluştu: \(error.localizedDescription)")
            }
        }
        
       }
       
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         if annotation is MKUserLocation {
             return nil
         }
         
         let reuseId = "pin"
         
         var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
         
         if pinView == nil {
             pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
             pinView?.canShowCallout = true
             let button = UIButton(type: .detailDisclosure)
             pinView?.rightCalloutAccessoryView = button
         } else {
             pinView?.annotation = annotation
         }
         
         return pinView
         
     }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
         if self.chosenLongitude != 0.0 && self.chosenLatitude != 0.0 {
             let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
             
             CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
                 if let placemark = placemarks {
                     
                     if placemark.count > 0 {
                         
                         let mkPlaceMark = MKPlacemark(placemark: placemark[0])
                         let mapItem = MKMapItem(placemark: mkPlaceMark)
                         mapItem.name = self.detailsNameLabel.text
                         
                         let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                         
                         mapItem.openInMaps(launchOptions: launchOptions)
                     }
                     
                 }
             }
             
         }
     }

}
