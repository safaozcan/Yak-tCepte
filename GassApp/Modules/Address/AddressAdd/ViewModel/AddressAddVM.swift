//
//  AddressVM.swift
//  GassApp
//
//  Created by Safa özcan on 4.08.2022.
//

import Foundation
class AddressAddVM : ViewModel{
    
    
    var addressCreated: (() -> Void)?
    
    
    func addressAddResponse(result : Result<AddressAddResponse,APIError>){
        
        switch result {
            
        case .failure(let error):
            switch error {
            case .commonProblem:
                DispatchQueue.main.async {
                    print("common")
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
                print("Adres kaydedildi")
                self.addressCreated?()
                //self.vehicleData = response.data
                //let defaults = UserDefaults.standard
                //defaults.set(response.token, forKey: "ACCESS_TOKEN")
                //self.signUpPageDataLoaded?()
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }
    
}

extension AddressAddVM {
    func createAddress(token: String?, tag: String?, detail: String?, lat: Double?, lng: Double?,willBeFav: Bool?){
        APIRequest().post(endpoint: APIRequest.CREATEADDRESS, completion: addressAddResponse, message: AddressAddRequest.init(token, tag, detail, lat, lng,willBeFav))
        
           
       }
    }
