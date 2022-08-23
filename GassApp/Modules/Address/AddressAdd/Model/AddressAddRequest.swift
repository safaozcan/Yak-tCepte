//
//  AddressAddRequest.swift
//  GassApp
//
//  Created by Safa özcan on 4.08.2022.
//

import Foundation

class AddressAddRequest : BaseRequest{
    
    var token : String?
    var tag : String?
    var detail : String?
    var lat : Double?
    var lng : Double?
    var willBeFav : Bool?
    
    init(_ token:String?,_ tag:String?,_ detail:String?,_ lat:Double?,_ lng:Double?,_ willBeFav:Bool?){
        super.init()
        self.token = token
        self.tag = tag
        self.detail = detail
        self.lat = lat
        self.lng = lng
        self.willBeFav = willBeFav

    }
    
    private enum CodingKeys: String, CodingKey{
        case token, tag, detail, lat, lng , willBeFav
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.token, forKey: .token)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encodeIfPresent(self.lat, forKey: .lat)
        try container.encodeIfPresent(self.lng, forKey: .lng)
        try container.encodeIfPresent(self.willBeFav, forKey: .willBeFav)

    }
}
    
    
