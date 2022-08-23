//
//  Address.swift
//  GassApp
//
//  Created by Safa özcan on 4.08.2022.
//

import Foundation

class Address: Decodable{

    var id : String?
    var tag : String?
    var detail : String?
    var lat : Double?
    var lng : Double?
    var willBeFav : Bool?
    var isFav : Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id , tag, detail, lat, lng, willBeFav, isFav
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String?.self, forKey: .id)
        tag = try container.decode(String?.self, forKey: .tag)
        detail = try container.decode(String?.self, forKey: .detail)
        lat = try container.decode(Double?.self, forKey: .lat)
        lng  = try container.decode(Double?.self, forKey: .lng)
        willBeFav = try container.decode(Bool?.self, forKey: .willBeFav)
        isFav = try container.decode(Bool?.self, forKey: .isFav)
        
        
    }
    
    
}
