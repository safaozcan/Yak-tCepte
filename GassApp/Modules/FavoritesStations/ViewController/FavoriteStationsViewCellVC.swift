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
    
    @IBOutlet weak var dizelLabel: UILabel!
    
    @IBOutlet weak var benzinLabel: UILabel!
    @IBOutlet weak var lpgLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var brandIcon: UIImageView!
    
    @IBAction func starTapped(_ sender: Any) {
        delegate?.removeFav()
    }
    
    

}
