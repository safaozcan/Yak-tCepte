//
//  FavoriteStationsVC.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit
class FavoriteStationsVC: BaseViewController<FavoriteStationsVM> ,UICollectionViewDelegate,UICollectionViewDataSource{

    var token : String?
    @IBOutlet private weak var favoriteStationsCollectionView: UICollectionView!
    @IBOutlet private var backIconTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteStationsCollectionView.register(UINib(nibName: "FavoriteStationsViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoriteStationsViewCell")
        
        let usr = UserDefaults.standard
        self.token = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        
    }
    
    @IBAction private func plusTapped(_ sender: Any) {
        
    }
    @IBAction private func backIconTapped(_ sender: Any) {
        let vm = HomePageVM()
        let vc = ViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteStationsViewCell", for: indexPath as IndexPath) as! FavoriteStationsViewCellVC
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //will retun the count of fav stations from API

        return 10
    }
}
extension FavoriteStationsVC: FavoriteStationsViewCellDelegate{
    func removeFav() {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Merhaba", message: "İstasyonu favorilerden çıkarmak istediğinizden emin misiniz?", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Evet", style: UIAlertAction.Style.default, handler: { action in
            // delete the fav from collection view and db
            print("removed")
                                      }))
        alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil))
            
            
        self.present(alert, animated: true, completion: nil)
        
        
        }

        
    }
    
    
}

extension FavoriteStationsVC: StoryboardInstantiable {
public static var storyboardName: String { return "FavoriteStationsView" }
public static var storyboardIdentifier: String? { return "FavoriteStationsView" }
}
