//
//  LoginRequest.swift
//  GassApp
//
//  Created by Safa özcan on 28.07.2022.
//

import Foundation

/*final class LoginRequest: BaseRequest{
    var username : String?
    var password : String?
    var token : String?
   
    
    init(_ username:String? ,_ password:String?,_ token:String?){
        super.init()
        self.username = username
        self.password = password
        self.token = token
        
    }
    
    private enum CodingKeys: String, CodingKey{
        case username, password, token
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.password, forKey: .password)
        try container.encodeIfPresent(self.token, forKey: .token)
        
    }
}*/
