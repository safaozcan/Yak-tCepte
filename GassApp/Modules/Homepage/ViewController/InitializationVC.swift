//
//  InitializationVC.swift
//  GassApp
//
//  Created by Safa özcan on 17.08.2022.
//

import Foundation
import UIKit
class InitializationVC : UIViewController{
    
    override func viewDidLoad() {
        
        initializeMain()
       
        
    }
    func initializeMain() {
        let vm = HomePageVM()
        let vc = ViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
