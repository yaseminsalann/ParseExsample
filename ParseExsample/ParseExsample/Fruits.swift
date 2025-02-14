//
//  Fruits.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import ParseSwift

struct Fruits: ParseObject {
    var originalData: Data?
    //kimin okup yazabildiğini belirtir
    var ACL: ParseSwift.ParseACL?
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    
    var name: String?
    var calories: Int?

    init() {}
}

