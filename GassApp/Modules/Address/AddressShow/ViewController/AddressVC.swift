//
//  AddressVC.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit

class AddressVC: BaseViewController<AddressVM> {
    
    var selectedRowNumber: Int?
    
    var token: String?
    
    @IBOutlet weak var addressCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usr = UserDefaults.standard
        let isUser = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        token = isUser
        viewModel?.loadAddress(token: isUser)
        
        viewModel?.updateUIAfterLoad = {[weak self]in
            DispatchQueue.main.async {
                self?.addressCollectionView.reloadData()
            }
        }
        
        viewModel?.updateUIAfterDeleteAddress = {[weak self]in
            
            DispatchQueue.main.async {
                self?.viewModel?.loadAddress(token: isUser)
                self?.addressCollectionView.reloadData()
            }
        }
        
        
        addressCollectionView.register(UINib(nibName: "AddressCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AddressCollectionViewCell")
        addressCollectionView.delegate = self
        
    }
    
    @IBAction func plusIconTapped(_ sender: Any) {
        
        
        let vm = AddressAddVM()
        let vc = AddressAddVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
   
    
    @IBAction func goBack(_ sender: Any) {
        let vm = HomePageVM()
        let vc = ViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        //toScreen(screenId: "Main", storyboardName: "Main")
    }
    
   
    
}

extension AddressVC: UICollectionViewDelegate, UICollectionViewDataSource, AddressCollectionViewCellDelegate{
    func toAddressEdit() {
        
    }
    
    func deleteAddress(id: String?) {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Merhaba", message: "Çıkış yapmak istediğinizden emin misiniz?", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Evet", style: UIAlertAction.Style.default, handler: { [self] action in
            
            viewModel?.deleteAddress(id: viewModel?.addressData?[selectedRowNumber ?? 0]?.id ?? "")
            
                                      }))
        alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil))
            
        self.present(alert, animated: true, completion: nil)
        
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.addressData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCollectionViewCell",for: indexPath as IndexPath) as! AddressCollectionViewCellVC
        
        cell.delegate = self
        
        cell.AddressLabel.text = viewModel?.addressData?[indexPath.row]?.detail
        cell.addressTagLabel.text = viewModel?.addressData?[indexPath.row]?.tag
        
        //cell.rowNumber.isHidden = true
        //cell.rowNumber.text = String(indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedRowNumber = indexPath.row
    }
    
}


/*extension AddressVC: AddressCollectionViewCellDelegate{

    
    func toAddressEdit() {
        
        
    }
    
    
    func deleteAddress(id: String?) {
        let idd = viewModel?.addressData?[selectedRowNumber]?.id
        viewModel?.deleteAddress(id: idd)
        
    }
    
    
}*/


extension AddressVC: StoryboardInstantiable {
    public static var storyboardName: String { return "AddressShowView" }
    public static var storyboardIdentifier: String? { return "AddressShowView" }
}

 
