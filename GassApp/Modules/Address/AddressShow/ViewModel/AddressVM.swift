//
//  AddressVM.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation
class AddressVM:ViewModel{
    
    var updateUIAfterLoad: (() -> Void)?
    
    var updateUIAfterDeleteAddress: (() -> Void)?
    
    func AddressShowResponse(result : Result<AddressShowResponse,APIError>){
        
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
                //let progressHUD = ProgressHUD(text: "Giriş Yapılıyor")
                //self.view.addSubview(progressHUD)
                  // All done!

                //self.view.backgroundColor = UIColor.white
                print("Adresler geldi")
                self.updateUIAfterLoad?()
                self.addressData = response.data
            //    let defaults = UserDefaults.standard
            //    defaults.set(response.token, forKey: "ACCESS_TOKEN")
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }
    func AddressDeleteResponse(result : Result<AddressDeleteResponse,APIError>){
        
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
                //let progressHUD = ProgressHUD(text: "Giriş Yapılıyor")
                //self.view.addSubview(progressHUD)
                  // All done!

                //self.view.backgroundColor = UIColor.white
                print("Adresler geldi")
                self.updateUIAfterDeleteAddress?()
                //self.addressData = response.data
            //    let defaults = UserDefaults.standard
            //    defaults.set(response.token, forKey: "ACCESS_TOKEN")
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }
}

extension AddressVM {
    func loadAddress(token: String){
          APIRequest().get(endpoint: APIRequest.GETADDRESS, completion: AddressShowResponse, queryItems: ["token" : String(token)])

           
       }
    func deleteAddress(id: String){
        APIRequest().delete(endpoint: APIRequest.DELETEADDRESS, completion: AddressDeleteResponse, queryItems: ["Id" : String(id)])
        
        
    }
    }

    
    

