//
//  Vehicle.swift
//  GassApp
//
//  Created by Safa özcan on 1.08.2022.
//

import Foundation

class Vehicle: Decodable{
    
    var id : String?
    var tag : String?
    var fuelType : String?
    
    
    
    private enum CodingKeys: String, CodingKey {
        case id ,tag ,fuelType
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String?.self, forKey: .id)
        tag = try container.decode(String?.self, forKey: .tag)
        fuelType = try container.decode(String?.self, forKey: .fuelType)
        
    }
    
    
}
