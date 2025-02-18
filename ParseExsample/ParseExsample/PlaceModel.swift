//
//  PlaceModel.swift
//  ParseExsample
//
//  Created by Yasemin salan on 18.02.2025.
//

import Foundation
import UIKit

class PlaceModel{
    static let sharedIntance = PlaceModel() // Tek bir nesne/obje oluşturuluyor.
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImageUrl = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    
    private init() {} // Dışarıdan oluşturmayı engeller.dışarıdan Logger() ile yeni bir nesne oluşturmayı engeller.Singleton'ın tek bir örnek olmasını garanti eder.

    
}
