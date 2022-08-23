//
//  VehicleEditRequest.swift
//  GassApp
//
//  Created by Safa özcan on 3.08.2022.
//

import Foundation

final class VehicleEditRequest: BaseRequest{
    var id : String?
    var tag : String?
    var fuelType : String?
    var token : String?
    
    
    init(_ id:String?,_ tag:String?,_ fuelType:String?,_ token:String?){
        super.init()
        self.id = id
        self.tag = tag
        self.fuelType = fuelType
        self.token = token
    
    }
    
    private enum CodingKeys: String, CodingKey{
        case id, tag, fuelType, token
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encodeIfPresent(self.fuelType, forKey: .fuelType)
        try container.encodeIfPresent(self.token, forKey: .token)

    }
}

   
