//
//  File.swift
//  GassApp
//
//  Created by Safa özcan on 3.08.2022.
//

import Foundation
class VehicleEditVM : ViewModel{
    
    var index: Int?
    var tag: String?
    var gasType: String?
    var id: String?
    
    var vehicleEdited: (() -> Void)?
    
    
    func vehicleEditResponse(result : Result<VehicleEditResponse,APIError>){
        
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
                print("Araç güncellendi")
                self.vehicleEdited?()
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

extension VehicleEditVM {
    func editVehicles(id:String?, tag: String?, fuelType: String?, token: String? ){
        APIRequest().put(endpoint: APIRequest.UPDATEVEHICLE, completion: vehicleEditResponse , message: VehicleEditRequest.init(id, tag, fuelType, token))
        
        
           
           
       }
    }

