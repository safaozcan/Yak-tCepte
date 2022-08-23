//
//  Station.swift
//  GassApp
//
//  Created by Safa özcan on 8.08.2022.
//

import Foundation
final class Station: Decodable{

    var specificName : String?
    var brand : String?
    var lat : Double?
    var lng : Double?
    var lpgPrice : Double?
    var gasolinePrice : Double?
    var gasolineKatkiliPrice : Double?
    var dieselPrice : Double?
    var dieselKatkiliPrice : Double?



private enum CodingKeys: String, CodingKey {
    case specificName, brand, lat, lng, lpgPrice, gasolinePrice, gasolineKatkiliPrice, dieselPrice, dieselKatkiliPrice
}

required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    specificName = try container.decode(String?.self, forKey: .specificName)
    brand = try container.decode(String?.self, forKey: .brand)
    lat = try container.decode(Double?.self, forKey: .lat)
    lng = try container.decode(Double?.self, forKey: .lng)
    lpgPrice = try container.decode(Double?.self, forKey: .lpgPrice)
    gasolinePrice = try container.decode(Double?.self, forKey: .gasolinePrice)
    gasolineKatkiliPrice = try container.decode(Double?.self, forKey: .gasolineKatkiliPrice)
    dieselPrice = try container.decode(Double?.self, forKey: .dieselPrice)
    dieselKatkiliPrice = try container.decode(Double?.self, forKey: .dieselKatkiliPrice)

    
}


}
