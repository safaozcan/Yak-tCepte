//
//  ProfileVC.swift
//  GassApp
//
//  Created by Safa özcan on 8.07.2022.
//

import Foundation
import UIKit
class ProfileVC: BaseViewController<ProfileVM>{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func toAddress(_ sender: Any) {
        let vm = AddressVM()
        let vc = AddressVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Merhaba", message: "Çıkış yapmak istediğinizden emin misiniz?", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Evet", style: UIAlertAction.Style.default, handler: { action in
            
            UserDefaults.standard.removeObject(forKey: "USER_TOKEN")
            UserDefaults.standard.removeObject(forKey: "ACCESS_TOKEN")
            let vm = LogInViewModel()
            let vc = LogInVC.instantiate(viewModel: vm)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
            
                                      }))
        alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil))
            
        self.present(alert, animated: true, completion: nil)
        
        }
        
    }
    
    @IBAction func backIconTapped(_ sender: Any) {
        let vm = HomePageVM()
        let vc = ViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    @IBAction func toVehicleShow(_ sender: Any) {
        let vm = VehicleShowVM()
        let vc = VehicleShowVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    @IBAction func toFavoriteStations(_ sender: Any) {
        let vm = FavoriteStationsVM()
        let vc = FavoriteStationsVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
extension ProfileVC: StoryboardInstantiable {
    public static var storyboardName: String { return "ProfileView" }
    public static var storyboardIdentifier: String? { return "ProfileView" }
}

