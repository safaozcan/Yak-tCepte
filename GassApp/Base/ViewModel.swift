//
//  File.swift
//  GassApp
//
//  Created by Safa özcan on 27.07.2022.
//

import Foundation
public class ViewModel: NSObject{
    deinit {
            //let type = Swift.type(of: self)
            //Log.debug("(type) DEALLOCATED")
        }
    var  vehicleData : [Vehicle?]?
    var  addressData : [Address?]?
    var  stationData : [Station?]?
        //var updateUI: (() -> Void)?
    
}
