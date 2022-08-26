//
//  VehicleEditVC.swift
//  GassApp
//
//  Created by Safa özcan on 3.08.2022.
//

import Foundation
import UIKit

class VehicleEditVC: BaseViewController<VehicleEditVM>{
   
    var token: String?
    
    
    @IBOutlet private weak var benzinButton: UIButton!
    @IBOutlet private weak var dizelButton: UIButton!
    
    @IBOutlet private weak var lpgButton: UIButton!
    
    @IBOutlet private weak var vehicleTagTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField(textField: vehicleTagTextField,placeHolder: "Araç İsmi")
        setButton(button: benzinButton)
        setButton(button: dizelButton)
        setButton(button: lpgButton)
        vehicleTagTextField.layer.cornerRadius = 6.0
        vehicleTagTextField.layer.borderWidth = 1.0
        vehicleTagTextField.layer.borderColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
        
        
        hideKeyboardWhenTappedAround()
        let usr = UserDefaults.standard
        self.token = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        //let indexRow = viewModel?.index
        
        vehicleTagTextField.text = viewModel?.tag
        
        if benzinButton.titleLabel?.text == viewModel?.gasType{
            benzinButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            dizelButton.isEnabled = false
            lpgButton.isEnabled = false
        }
        if dizelButton.titleLabel?.text == viewModel?.gasType {
            dizelButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            benzinButton.isEnabled = false
            lpgButton.isEnabled = false
        }
        if lpgButton.titleLabel?.text == viewModel?.gasType{
            lpgButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
            benzinButton.isEnabled = false
            dizelButton.isEnabled = false
        }
        
        
        //viewModel?.vehicleData?[indexRow ?? 0]?.tag
        viewModel?.vehicleEdited = { [weak self] in
            DispatchQueue.main.async {
                let vm = VehicleShowVM()
                let vc = VehicleShowVC.instantiate(viewModel: vm)
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
                
            }
            
        }
        

        
    }
    
    @IBAction private func dizelButtonTapped(_ sender: Any) {
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
    
    @IBAction private func lpgButtonTapped(_ sender: Any) {
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
    
    
    
    @IBAction private func benzinButtonTapped(_ sender: Any) {
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
    @IBAction private func saveButtonTapped(_ sender: Any) {
        viewModel?.editVehicles( id: viewModel?.id, tag: vehicleTagTextField.text, fuelType: viewModel?.gasType,token: self.token)
    }
    
    @IBAction private func backIconTapped(_ sender: Any) {
        let vm = VehicleShowVM()
        let vc = VehicleShowVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}
extension VehicleEditVC{
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
extension VehicleEditVC: StoryboardInstantiable {
    public static var storyboardName: String { return "VehicleEditView" }
    public static var storyboardIdentifier: String? { return "VehicleEditView" }
}
