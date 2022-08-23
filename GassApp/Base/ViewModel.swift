//
//  File.swift
//  GassApp
//
//  Created by Safa özcan on 27.07.2022.
//

import Foundation
protocol baseViewModelProtocol{
    
    
}
public class ViewModel: NSObject{
    deinit {
            //let type = Swift.type(of: self)
            //Log.debug("(type) DEALLOCATED")
        }
    //var isLPG: Bool = false
    var  vehicleData : [Vehicle?]?
    var  addressData : [Address?]?
    var  stationData : [Station?]?
        //var errorHandler: (( error: TDError) -> Void)?
        //var retryHandler: (( customMessage: String?) -> Void)?
        //var updateUI: (() -> Void)?
    
}
