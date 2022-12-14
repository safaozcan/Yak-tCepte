//
//  AddressShowResponse.swift
//  GassApp
//
//  Created by Safa özcan on 4.08.2022.
//

import Foundation
final class AddressShowResponse: BaseResponse{
 
    var data : [Address?]
    var success : Bool?
    var statusCode : Int?
    var message : String?
    var token : String?
    
    private enum CodingKeys: String, CodingKey {
        case data, success, statusCode, message , token
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([Address?].self, forKey: .data)
        success = try container.decode(Bool?.self, forKey: .success)
        statusCode = try container.decode(Int?.self, forKey: .statusCode)
        message = try container.decode(String?.self, forKey: .message)
        token = try container.decode(String?.self, forKey: .token)
        try super.init(from: decoder)
    }
        
        
    
    
    
    
}
