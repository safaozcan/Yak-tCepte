//
//  VehicleRequest.swift
//  GassApp
//
//  Created by Safa özcan on 28.07.2022.
//

import Foundation

final class VehicleShowRequest: BaseRequest{
    var token : String?
   
    
    init(_ token:String?){
        super.init()
        self.token = token
        
    }
    
    private enum CodingKeys: String, CodingKey{
        case token
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.token, forKey: .token)
        
    }
}
