
//
//  VehicleShowVC.swift
//  GasApp
//
//  Created by Safa özcan on 4.07.2022.


import Foundation

import UIKit



class VehicleShowVC: BaseViewController<VehicleShowVM> {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usr = UserDefaults.standard
        let isUser = usr.string(forKey: "ACCESS_TOKEN") ?? ""

        viewModel?.updateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        viewModel?.updateUIAfterDelete = { [weak self] in
            DispatchQueue.main.async {
                self?.viewModel?.loadVehicles(token: isUser )
                self?.collectionView.reloadData()
                
            }
            
        }
        
        
        viewModel?.loadVehicles(token: isUser )
        
        collectionView.register(UINib(nibName: "VehicleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VehicleCollectionViewCell")
        collectionView.delegate = self
        
    }
    
    
    
    @IBAction private func goBack(_ sender: Any) {
        let vm = HomePageVM()
        let vc = ViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
       
    }
    
    
    @IBAction private func toVehicleAdd(_ sender: Any) {
        
            
            let vm = VehicleAddVM()
            let vc = VehicleAddVC.instantiate(viewModel: vm)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        
       
    }
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
}
extension VehicleShowVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return  viewModel?.vehicleData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCollectionViewCell",for: indexPath as IndexPath) as! VehicleCollectionViewCellVC
    
        cell.gassTypeLabel.text = viewModel?.vehicleData?[indexPath.row]?.fuelType
        cell.vehicleName.text = viewModel?.vehicleData?[indexPath.row]?.tag
        cell.rowNumber.isHidden = true
        cell.rowNumber.text = String(indexPath.row)
        cell.delegate = self
              
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //deleteVehicle(id: viewModel?.vehicleData?[indexPath.row]?.id)
        
    }
    
    
}

extension VehicleShowVC: VehicleCollectionViewCellDelegate{
    
    func toVehicleEdit(id: String?,row: String?) {
  
        let indexpath = Int(row ?? "0") ?? 0
        
        let vm = VehicleEditVM()
        let vc = VehicleEditVC.instantiate(viewModel: vm)
        
        vm.tag = viewModel?.vehicleData?[indexpath]?.tag
        vm.gasType = viewModel?.vehicleData?[indexpath]?.fuelType
        vm.id = viewModel?.vehicleData?[indexpath]?.id
        vm.index = indexpath
        

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

        
        
    }
    
    func deleteVehicle(id: String?,row: String?) {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Merhaba", message: "İstasyonu favorilerden çıkarmak istediğinizden emin misiniz?", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Evet", style: UIAlertAction.Style.default, handler: { action in
            
            let indexpath = Int(row ?? "0") ?? 0
            let id = self.viewModel?.vehicleData?[indexpath]?.id
            self.viewModel?.deleteVehicles(id: id!)
            
                                      }))
        alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil))
            
            
        self.present(alert, animated: true, completion: nil)
        
        
        }
       
        
    }
    
    
}




extension VehicleShowVC: StoryboardInstantiable {
    public static var storyboardName: String { return "VehicleShowView" }
    public static var storyboardIdentifier: String? { return "VehicleShowView" }
}



