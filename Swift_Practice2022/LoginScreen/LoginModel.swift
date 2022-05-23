//
//  LoginModel.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 20/05/22.
//

import Foundation

struct LoginModel: Codable {
    let data: [Datum]
    let included: [Included]
}


struct Datum: Codable {
    let type, id: String
    let attributes: DatumAttributes
    let relationships: Relationships
}

struct DatumAttributes: Codable {
    let title, body, created, updated: String
    
}

struct Relationships: Codable {
    let author: Author
}

struct Author: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let id, type: String
}

struct Included: Codable {
    let type, id: String
    let attributes: IncludedAttributes
}
struct IncludedAttributes: Codable {
    let name: String
    let age: Int
    let maleorfemale: String
    
    enum CodingKeys: String, CodingKey {
        case name,age
        case maleorfemale = "gender"
    }
    
}
