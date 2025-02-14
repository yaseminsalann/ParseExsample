//
//  User.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import ParseSwift

struct User: ParseUser {
    var emailVerified: Bool?
    
    var authData: [String : [String : String]?]?
    
    var originalData: Data?
    
    var createdAt: Date?
    
    var updatedAt: Date?
    
    var ACL: ParseSwift.ParseACL?
    
    var objectId: String? // Kullanıcıya ait benzersiz kimlik
    var username: String? // Kullanıcı adı
    var email: String?    // Kullanıcı e-posta adresi
    var password: String? // Kullanıcı parolası
    
    // Varsayılan boş init fonksiyonu
    init() {}
}
