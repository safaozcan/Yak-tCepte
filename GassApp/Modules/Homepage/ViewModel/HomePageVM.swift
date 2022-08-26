//
//  HomePageVM.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit
import CoreLocation

class HomePageVM: ViewModel{
    
    var stations: [Station]?
    var station: Station?
    var mapLocation : CLLocationCoordinate2D?
    var isfilter : Bool = false
    var updateMap: (() -> Void)?
    var vmm: ViewModel?
    
    var indexForBottomSheet: Int?
    
    var isBenzin: Bool = false
    var isKatkılıBenzin: Bool = false
    var isDizel: Bool = false
    var isKatkılıDizel: Bool = false
    var isLPG: Bool = false
    
    var isAygaz = true
    var isAytemiz = true
    var isBP = true
    var isGo = true
    var isKadoil = true
    var isMogaz = true
    var isOpet = true
    var isPetrolOfisi = true
    var isShell = true
    var isTotal = true
    
   
    private func NearStationResponse(result : Result<NearStationsResponse,APIError>){
        
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
                
                self.updateMap?()
                self.stationData = response.data
                self.stations = response.data
            //    let defaults = UserDefaults.standard
            //    defaults.set(response.token, forKey: "ACCESS_TOKEN")
                //self.signUpPageDataLoaded?()
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }
    private func addFavResponse(result : Result<AddFavResponse,APIError>){
        
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
              
                //self.updateMap?()
    
            //    let defaults = UserDefaults.standard
            //    defaults.set(response.token, forKey: "ACCESS_TOKEN")
                //self.signUpPageDataLoaded?()
                let user = UserDefaults.standard
                user.set(true, forKey: "USER_TOKEN")
                
                    
            }
            break;
        }
    }
}

extension HomePageVM {
    func loadStations(lat: Double, lng: Double){
        APIRequest().get(endpoint: APIRequest.NEARSTATIONS, completion: NearStationResponse, queryItems: ["lat" : String(lat), "lng" : String(lng) ])

           
       }
    func addFavStation(token: String?, specificName: String?, brand: String?, lat: Double?, lng: Double?, lpgPrice: Double?, gasolinePrice: Double?, gasolineKatkiliPrice: Double?, dieselPrice: Double?, dieselKatkiliPrice: Double?, lastUpdate: String? ){
        APIRequest().post(endpoint: APIRequest.ADDFAVSTATİON, completion: addFavResponse, message: AddFavRequest.init(token, specificName, brand, lat, lng, lpgPrice, gasolinePrice, gasolineKatkiliPrice, dieselPrice, dieselKatkiliPrice, lastUpdate))
            }
   
    }
//APIRequest().post(endpoint: APIRequest.CREATEVEHICLE, completion: vehicleAddResponse, message: VehicleAddRequest.init(token, tag, fuelType,false))
