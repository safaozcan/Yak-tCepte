//
//  AddressAddVC.swift
//  GassApp
//
//  Created by Safa özcan on 4.08.2022.
//

import Foundation
import UIKit
import GooglePlaces
class AddressAddVC: BaseViewController<AddressAddVM>{
    
    var token : String?
    var addres: CLLocationCoordinate2D?
    @IBOutlet weak var addressTag: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usr = UserDefaults.standard
        self.token = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        setTextField(textField: addressTag, placeHolder: "Adresinize başlık giriniz")
        setTextField(textField: cityTextField, placeHolder: "Adresinizi aratınız")
        addressTag.layer.cornerRadius = 6.0
        addressTag.layer.borderWidth = 1.0
        addressTag.layer.borderColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
        addressTag.textColor = .gray
        
        
        cityTextField.layer.cornerRadius = 6.0
        cityTextField.layer.borderWidth = 1.0
        cityTextField.layer.borderColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
        cityTextField.textColor = .gray
        viewModel?.addressCreated = {[weak self]in
            DispatchQueue.main.async {
                let vm = AddressVM()
                let vc = AddressVC.instantiate(viewModel: vm)
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
            }
        }
    }
    
    @IBAction func backIconTapped(_ sender: Any) {
        let vm = AddressVM()
        let vc = AddressVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    @IBAction func addressSearch(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
           autocompleteController.delegate = self

           // Specify the place data types to return.
           let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
             UInt(GMSPlaceField.coordinate.rawValue))
           autocompleteController.placeFields = fields

           // Specify a filter.
            let filter = GMSAutocompleteFilter()
            filter.type = .noFilter
            filter.country = "TR"
            autocompleteController.autocompleteFilter = filter

           // Display the autocomplete view controller.
           present(autocompleteController, animated: true, completion: nil)
         }

         
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel?.createAddress(token: token,tag: addressTag.text, detail: cityTextField.text,lat: addres?.latitude,lng: addres?.longitude, willBeFav: false )
        
    }
}
    extension AddressAddVC: GMSAutocompleteViewControllerDelegate {

      // Handle the user's selection.
      func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
          addres = place.coordinate
          cityTextField.text = place.name
       
        dismiss(animated: true, completion: nil)
      }

      func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
      }

      // User canceled the operation.
      func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
      }

    }
    
    
    

extension AddressAddVC: StoryboardInstantiable {
    public static var storyboardName: String { return "AddressAddView" }
    public static var storyboardIdentifier: String? { return "AddressAddView" }
}
