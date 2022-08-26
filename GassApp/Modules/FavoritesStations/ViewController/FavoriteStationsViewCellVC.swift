//
//  FavoriteStationsViewCellVC.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit
protocol FavoriteStationsViewCellDelegate: AnyObject {
    func removeFav()
}
class FavoriteStationsViewCellVC: UICollectionViewCell{
    weak var delegate: FavoriteStationsViewCellDelegate?
    
    @IBOutlet private weak var dizelLabel: UILabel!
    
    @IBOutlet private weak var benzinLabel: UILabel!
    @IBOutlet private weak var lpgLabel: UILabel!
    @IBOutlet private weak var starButton: UIButton!
    @IBOutlet private weak var brandIcon: UIImageView!
    
    @IBAction private func starTapped(_ sender: Any) {
        delegate?.removeFav()
    }
    
    

}
