//
//  FavoriteStationsVM.swift
//  GassApp
//
//  Created by Safa özcan on 25.07.2022.
//

import Foundation
class FavoriteStationsVM: ViewModel {
    
    
    //public var vehicleData : [Vehicle?]?
    var updateFav: (() -> Void)?
    
    var updateUIAfterDelete: (() -> Void)?
    
    
   /* func favStationsShowResponse(result : Result<VehicleShowResponse,APIError>){
        
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
               
                self.updateFav?()
                
            //    let defaults = UserDefaults.standard
            //    defaults.set(response.token, forKey: "ACCESS_TOKEN")
                //self.signUpPageDataLoaded?()
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }*/
    func favStationsDeleteResponse(result : Result<VehicleDeleteResponse,APIError>){
        
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
                print("Araç silindi")
                //self.updateUI?()
                
               // self.vehicleData = response.data
                //let defaults = UserDefaults.standard
               //defaults.set(response.token, forKey: "ACCESS_TOKEN")
                self.updateUIAfterDelete?()
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }
    
}

extension FavoriteStationsVM {
    /*func loadFavStations(token: String){
            APIRequest().get(endpoint: APIRequest.LOADFAVS, completion: favStationsShowResponse, queryItems: ["token" : String(token)])

           
       }*/
    func deleteFavStations(id: String){
        APIRequest().delete(endpoint: APIRequest.DELETEVEHICLE, completion: favStationsDeleteResponse, queryItems: ["Id" : String(id)])
        
        
    }
    }


