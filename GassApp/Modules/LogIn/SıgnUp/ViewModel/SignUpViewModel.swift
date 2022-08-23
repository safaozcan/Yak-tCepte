//
//  SignUpViewModel.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation
import UIKit
class SignUpViewModel : ViewModel{
    
    var signUpPageDataLoaded: (() -> Void)?
    var signUpAlert: (() -> Void)?
    
    func registerResponse(result :Result<RegisterResponse,APIError>){
        
        switch result {
        case .failure(let error):
            switch error {
            case .commonProblem:
                DispatchQueue.main.async {
                    //error alert ???
                }
                break;
            case .decodingProblem:
                DispatchQueue.main.async {
                    print("decoding problem")
                }
                break;
            case .responseProblem(error: let error):
                DispatchQueue.main.async {
                             print(error)
                           }
                break;
            case .encodingProblem:
                DispatchQueue.main.async {
                    print("encoding problem")
                }
                break;
            }
            break;
        case .success(let response):
            DispatchQueue.main.async {
                if response.success!{
                
                print("Kayıt başarılı")
                let defaults = UserDefaults.standard
                defaults.set(response.token, forKey: "ACCESS_TOKEN")
                self.signUpPageDataLoaded?()
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                }
                else{
                    self.signUpAlert?()
                    
                }
                    
            }
            break;
        }
    }
    
}

extension SignUpViewModel {
    func SignUpUser(email:String, name: String, surname: String, password: String){
        APIRequest().post(endpoint: APIRequest.REGISTER, completion: registerResponse, message: RegisterRequest.init(email, name, surname, password))

       
    }
    
}
