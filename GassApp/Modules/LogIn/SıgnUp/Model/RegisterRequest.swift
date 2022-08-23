//
//  RegisterRequest.swift
//  GassApp
//
//  Created by Safa özcan on 28.07.2022.
//

import Foundation


final class RegisterRequest: BaseRequest{
    var email : String?
    var name : String?
    var surname : String?
    var password : String?

    
    init(_ email:String?,_ name:String?,_ surname:String?,_ password:String?){
        super.init()
        self.email = email
        self.name = name
        self.surname = surname
        self.password = password

    }
    
    private enum CodingKeys: String, CodingKey{
        case email, name, surname, password
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.surname, forKey: .surname)
        try container.encodeIfPresent(self.password, forKey: .password)

    }
}
