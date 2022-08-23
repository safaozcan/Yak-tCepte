//
//  VehicleAddRequest.swift
//  GassApp
//
//  Created by Safa özcan on 1.08.2022.
//

import Foundation
final class VehicleAddRequest: BaseRequest{
    var token : String?
    var tag : String?
    var fuelType : String?
    var willBeFav: Bool?
    
    init(_ token:String?,_ tag:String?,_ fuelType:String?,_ willBeFav:Bool?){
        super.init()
        self.token = token
        self.tag = tag
        self.fuelType = fuelType
        self.willBeFav = willBeFav

    }
    
    private enum CodingKeys: String, CodingKey{
        case token, tag, fuelType, willBeFav
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.token, forKey: .token)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encodeIfPresent(self.fuelType, forKey: .fuelType)
        try container.encodeIfPresent(self.willBeFav, forKey: .willBeFav)
       

    }
}
