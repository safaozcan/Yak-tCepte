//
//  ButtomSheetVC.swift
//  GassApp
//
//  Created by Safa özcan on 28.07.2022.
//

import Foundation
import UIKit
class BottomSheetVC: BaseViewController<HomePageVM>{
    
    @IBOutlet private weak var brandImageView: UIImageView!
    @IBOutlet private weak var benzinPriceLabel: UILabel!
    @IBOutlet private weak var katkılıBenzinPriceLabel: UILabel!
    @IBOutlet private weak var dizelPriceLabel: UILabel!
    @IBOutlet private weak var katkılıDizelLabel: UILabel!
    @IBOutlet private weak var lpgPriceLabel: UILabel!
    @IBOutlet private weak var starTapped: UIButton!
    
    var token: String?
    var logo: String?
    @IBAction private func addFavTapped(_ sender: Any) {
        viewModel?.addFavStation(token: token, specificName: viewModel?.station?.specificName, brand: viewModel?.station?.brand, lat: viewModel?.station?.lat, lng: viewModel?.station?.lng, lpgPrice: viewModel?.station?.lpgPrice, gasolinePrice: viewModel?.station?.gasolinePrice, gasolineKatkiliPrice: viewModel?.station?.gasolineKatkiliPrice, dieselPrice: viewModel?.station?.dieselPrice, dieselKatkiliPrice: viewModel?.station?.dieselKatkiliPrice, lastUpdate: nil)
    }
    private func setLogo(brandLogo: String){
        brandImageView?.image = UIImage(named: brandLogo )
        //brandImageView?.image = brandLogo
        
        
    }
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 28
        
        let usr = UserDefaults.standard
        self.token = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        
        benzinPriceLabel.text! += String((viewModel?.station?.gasolinePrice)!)
        katkılıBenzinPriceLabel.text! += String((viewModel?.station?.gasolineKatkiliPrice)!)
        dizelPriceLabel.text! += String((viewModel?.station?.dieselPrice)!)
        katkılıDizelLabel.text! += String((viewModel?.station?.dieselKatkiliPrice)!)
        lpgPriceLabel.text! += String((viewModel?.station?.lpgPrice)!)
        brandImageView.image = (UIImage(named: viewModel?.station?.brand ?? "DefaultGasStation")) ?? UIImage(named: "DefaultGasStation")
        //setLogo(brandLogo: S)
        
        }
        
            
            
        }
    
    
extension BottomSheetVC: StoryboardInstantiable {
    public static var storyboardName: String { return "BottomSheet" }
    public static var storyboardIdentifier: String? { return "BottomSheet" }
}
    
    

