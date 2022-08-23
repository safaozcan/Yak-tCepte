//
//  VehicleAddVC.swift
//  GassApp
//
//  Created by Safa özcan on 22.07.2022.
//

import Foundation
import UIKit

class VehicleAddVC: BaseViewController<VehicleAddVM>{
    
    
    var token : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setButton(button: benzinButton)
        setButton(button: dizelButton)
        setButton(button: lpgButton)
        setTextField(textField: vehicleTagTextField,placeHolder: "Araç İsmini giriniz")
        vehicleTagTextField.layer.cornerRadius = 6.0
        vehicleTagTextField.layer.borderWidth = 1.0
        vehicleTagTextField.layer.borderColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
        fuelType.text = "Yakit tipini seçiniz"
        fuelType.textColor = .black
        let usr = UserDefaults.standard
        self.token = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        
        viewModel?.vehicleCreated = { [weak self] in
            DispatchQueue.main.async {
                let vm = VehicleShowVM()
                let vc = VehicleShowVC.instantiate(viewModel: vm)
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
            }
            
        }
        
    }
    
    @IBOutlet weak var vehicleTagTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var lpgButton: UIButton!
    @IBOutlet weak var dizelButton: UIButton!
    @IBOutlet weak var benzinButton: UIButton!
    @IBOutlet weak var fuelType: UILabel!
    
    @IBAction func backIconTapped(_ sender: Any) {
        let vm = VehicleShowVM()
        let vc = VehicleShowVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    @IBAction func savaButtonTapped(_ sender: Any) {
        viewModel?.createVehicles(token: self.token ?? "", tag: vehicleTagTextField.text, fuelType: viewModel?.gasType)
        
        
    }
  
  
        @IBAction func benzinButtonTapped(_ sender: Any) {
        if benzinButton.backgroundColor == .white {
            benzinButton.backgroundColor =  UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            benzinButton.tintColor = .white
            isTapped(button: benzinButton)
            dizelButton.isEnabled = false
            lpgButton.isEnabled = false
        }
        else {
            benzinButton.backgroundColor = .white
            benzinButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            dizelButton.isEnabled = true
            lpgButton.isEnabled = true
        }
        
    }
    
    @IBAction func dizelButtonTapped(_ sender: Any) {
        if dizelButton.backgroundColor == .white {
            dizelButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            dizelButton.tintColor = .white
            isTapped(button: dizelButton)
            benzinButton.isEnabled = false
            lpgButton.isEnabled = false
        }
        else {
            dizelButton.backgroundColor = .white
            dizelButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            lpgButton.isEnabled = true
            benzinButton.isEnabled = true
        }
        
    }
    @IBAction func lpgButtonTapped(_ sender: Any) {
        if lpgButton.backgroundColor == .white {
            lpgButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            lpgButton.tintColor = .white
            isTapped(button: lpgButton)
            dizelButton.isEnabled = false
            benzinButton.isEnabled = false
        }
        else {
            lpgButton.backgroundColor = .white
            lpgButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            dizelButton.isEnabled = true
            benzinButton.isEnabled = true
        }
        
    }
}
extension VehicleAddVC{

    func setButton(button: UIButton){
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = CGColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        button.layer.shadowColor = CGColor(gray: 0.3, alpha: 0.5)
        button.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
    }
    func isTapped(button: UIButton) {
        viewModel?.gasType = button.titleLabel?.text
    }
}
extension VehicleAddVC: StoryboardInstantiable {
    public static var storyboardName: String { return "VehicleAddView" }
    public static var storyboardIdentifier: String? { return "VehicleAddView" }
}

