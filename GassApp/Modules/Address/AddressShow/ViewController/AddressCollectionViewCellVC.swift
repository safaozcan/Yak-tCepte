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
    
    @IBOutlet private weak var addressDeleteButton: UIButton!
    @IBOutlet weak var addressTagLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet private weak var addressEditButton: UIButton!
    
    @IBAction private func addressEditButtonTapped(_ sender: Any) {
        delegate?.toAddressEdit()
    }
    
    @IBAction private func addressDeleteButtonTapped(_ sender: Any) {
        delegate?.deleteAddress(id: "")
    }
    
}
