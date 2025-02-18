//
//  Places.swift
//  ParseExsample
//
//  Created by Yasemin salan on 19.02.2025.
//

import ParseSwift

// ParseObject modelinizi oluşturun
struct Places:ParseObject{
    // Parse sınıfı ismi (veri tabanında bu isimle saklanır)
    var originalData: Data?
    
    var objectId: String?
    
    var createdAt: Date?
    
    var updatedAt: Date?
    var isActive: Bool?
    
    var ACL: ParseSwift.ParseACL?
    
    var name: String?
    var type: String?
    var atmosphere: String?
    var latitude: String?
    var longitude: String?
    // Görsel dosyasını saklayacak property
    var imageFile: ParseFile?
    
    
}

