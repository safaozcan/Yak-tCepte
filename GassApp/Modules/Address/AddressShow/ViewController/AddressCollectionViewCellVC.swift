//
//  AddressCollectionViewCellVC.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit
protocol AddressCollectionViewCellDelegate: AnyObject {
    func toAddressEdit()
    func deleteAddress(id: String?)
    
}
class AddressCollectionViewCellVC: UICollectionViewCell{
    weak var delegate: AddressCollectionViewCellDelegate?
    
    @IBOutlet weak var addressDeleteButton: UIButton!
    @IBOutlet weak var addressTagLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var addressEditButton: UIButton!
    
    @IBAction func addressEditButtonTapped(_ sender: Any) {
        delegate?.toAddressEdit()
    }
    
    @IBAction func addressDeleteButtonTapped(_ sender: Any) {
        delegate?.deleteAddress(id: "")
    }
    
}
