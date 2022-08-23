//
//  VehicleCollectionViewCellVC.swift
//  GasApp
//
//  Created by Safa özcan on 4.07.2022.
//

import Foundation
import UIKit

protocol VehicleCollectionViewCellDelegate : AnyObject{
    func toVehicleEdit(id: String?, row: String?)
    func deleteVehicle(id: String?, row: String?)
}
class VehicleCollectionViewCellVC: UICollectionViewCell{
    weak var delegate : VehicleCollectionViewCellDelegate?
    
    
    
    @IBOutlet weak var rowNumber: UILabel!
    @IBOutlet weak var gassTypeLabel: UILabel!
    @IBOutlet weak var vehicleName: UILabel!
    @IBOutlet weak var vehicleDeleteButton: UIButton!
    @IBOutlet weak var vehicleEditButton: UIButton!
    
    @IBAction func vehicleeditTapped(_ sender: Any) {
        delegate?.toVehicleEdit(id: "", row: rowNumber.text)
    }
    @IBAction func vehicleDeleteTapped(_ sender: Any) {
        delegate?.deleteVehicle(id: "", row: rowNumber.text)
        
    }

        
}

