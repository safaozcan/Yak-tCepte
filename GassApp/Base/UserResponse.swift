//
//  UserResponse.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation


final class UserResponse: BaseResponse{
    
    var user : User?
    
    
    private enum CodingKeys: String, CodingKey {
        case user
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decode(User?.self, forKey: .user)
        try super.init(from: decoder)
    }
}

