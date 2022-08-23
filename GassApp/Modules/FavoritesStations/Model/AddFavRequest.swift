//
//  AddFavResponse.swift
//  GassApp
//
//  Created by Safa özcan on 19.08.2022.
//

import Foundation

final class AddFavRequest: BaseRequest{
    var token : String?
    var specificName : String?
    var brand : String?
    var lat: Double?
    var lng: Double?
    var lpgPrice: Double?
    var gasolinePrice: Double?
    var gasolineKatkiliPrice: Double?
    var dieselPrice: Double?
    var dieselKatkiliPrice: Double?
    var lastUpdate: String?
    
    
    init(_ token:String?,_ specificName:String?,_ brand:String?,_ lat:Double?,_ lng:Double?,_ lpgPrice:Double?,_ gasolinePrice:Double?,_ gasolineKatkiliPrice:Double?,_ dieselPrice:Double?,_ dieselKatkiliPrice:Double?,_ lastUpdate:String?){
        super.init()
        self.token = token
        self.specificName = specificName
        self.brand = brand
        self.lat = lat
        self.lng = lng
        self.lpgPrice = lpgPrice
        self.gasolinePrice = gasolinePrice
        self.gasolineKatkiliPrice = gasolineKatkiliPrice
        self.dieselPrice = dieselPrice
        self.dieselKatkiliPrice = dieselKatkiliPrice
        self.lastUpdate = lastUpdate
        
      

    }
    
    private enum CodingKeys: String, CodingKey{
        case token, specificName, brand, lat,lng,lpgPrice,gasolinePrice,gasolineKatkiliPrice,dieselPrice,dieselKatkiliPrice,lastUpdate
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.token, forKey: .token)
        try container.encodeIfPresent(self.specificName, forKey: .specificName)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.lat, forKey: .lat)
        try container.encodeIfPresent(self.lng, forKey: .lng)
        try container.encodeIfPresent(self.lpgPrice, forKey: .lpgPrice)
        try container.encodeIfPresent(self.gasolinePrice, forKey: .gasolinePrice)
        try container.encodeIfPresent(self.gasolineKatkiliPrice, forKey: .gasolineKatkiliPrice)
        try container.encodeIfPresent(self.dieselPrice, forKey: .dieselPrice)
        try container.encodeIfPresent(self.dieselKatkiliPrice, forKey: .dieselKatkiliPrice)
        try container.encodeIfPresent(self.lastUpdate, forKey: .lastUpdate)
        
        
       

    }
}
