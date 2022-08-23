//
//  User.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation
class User: Codable{
    
    var password : String?
    var email : String?
    
    
    
    private enum CodingKeys: String, CodingKey {
        case password ,email
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        password = try container.decode(String?.self, forKey: .password)
        email = try container.decode(String?.self, forKey: .email)
        
    }
    
    
}
