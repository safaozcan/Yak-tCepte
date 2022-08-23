//
//  LogInViewModel.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation
final class LogInViewModel: ViewModel {

    var logInPageDataLoaded: (() -> Void)?

    var loginAlert: (() -> Void)?
   
    func loginResponse(result :Result<LoginResponse,APIError>){
        
        
        if let response = serverResponse(result: result){
                    DispatchQueue.main.async {
                        let user = UserDefaults.standard
                        user.set(true, forKey: "USER_TOKEN")
                        user.set(response.token, forKey: "ACCESS_TOKEN")
                        
                    }
                }
        
        switch result {
            
        case .failure(let error):
            switch error {
            case .commonProblem:
                DispatchQueue.main.async {
                    //let view = UINib(nibName: "LoginErrorPopUp", bundle: nil).instantiate(withOwner: nil, options: nil).first as! LoginErrorPopUp
                    //view.frame = self.view.bounds
                    //self.view.addSubview(view)
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
                    let defaults = UserDefaults.standard
                    defaults.set(response.token, forKey: "ACCESS_TOKEN")
               
                    let user = UserDefaults.standard
                    user.set(true, forKey: "USER_TOKEN")
                    self.logInPageDataLoaded?()
                }
                else{
                    self.loginAlert?()
                }
                
            }
            break;
        }
    }
    
}

extension LogInViewModel {
    func logInUser(email: String, password: String){
        APIRequest().get(endpoint: APIRequest.LOGIN, completion: loginResponse, queryItems: ["Email" : String(email), "Password" : String(password)])

       
   }
}
