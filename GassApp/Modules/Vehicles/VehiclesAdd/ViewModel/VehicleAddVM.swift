//
//  VehicleAddVM.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation
class VehicleAddVM:ViewModel{

    var gasType: String?
    var vehicleCreated: (() -> Void)?
    
    
    private func vehicleAddResponse(result : Result<VehicleAddResponse,APIError>){
        
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
                print("Araç kaydedildi")
                self.vehicleCreated?()
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

extension VehicleAddVM {
    func createVehicles(token: String?, tag: String?, fuelType: String?){
        APIRequest().post(endpoint: APIRequest.CREATEVEHICLE, completion: vehicleAddResponse, message: VehicleAddRequest.init(token, tag, fuelType,false))
        
        
           
           
       }
    }
    
    
    
    

