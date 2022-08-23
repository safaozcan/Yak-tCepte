//
//  FilterVC.swift
//  GassApp
//
//  Created by Safa özcan on 21.07.2022.
//

import Foundation
import UIKit

class FilterVC: BaseViewController<HomePageVM>{
    
    
    
    
    override func viewDidLoad() {
        setupUI()
        
    }
    
    
    
    
    func setupUI(){
        setButton(button: benzinButton)
        setButton(button: benzinKatkılıButton)
        setButton(button: dizelButton)
        setButton(button: dizelKatkılıButton)
        setButton(button: lpgButton)
        setButton(button: aygazButton)
        setButton(button: aytemizButton)
        setButton(button: bpButton)
        setButton(button: goButton)
        setButton(button: kadoilButton)
        setButton(button: mogazButton)
        setButton(button: petrolOfisiButton)
        setButton(button: opetButton)
        setButton(button: shellButton)
        setButton(button: totalButton)
        setButton(button: UygulaButton)
        
        
    }
    
    
    @IBOutlet weak var benzinButton: UIButton!
    @IBOutlet weak var benzinKatkılıButton: UIButton!
    @IBOutlet weak var dizelButton: UIButton!
    @IBOutlet weak var dizelKatkılıButton: UIButton!
    @IBOutlet weak var lpgButton: UIButton!
    @IBOutlet weak var aygazButton: UIButton!
    @IBOutlet weak var aytemizButton: UIButton!
    @IBOutlet weak var bpButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var kadoilButton: UIButton!
    @IBOutlet weak var mogazButton: UIButton!
    @IBOutlet weak var petrolOfisiButton: UIButton!
    @IBOutlet weak var opetButton: UIButton!
    @IBOutlet weak var shellButton: UIButton!
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var UygulaButton: UIButton!
    
    @IBAction func benzinButtonTapped(_ sender: Any) {
        benzinButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        benzinButton.tintColor = .white
        
        benzinKatkılıButton.backgroundColor = .white
        benzinKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        dizelButton.backgroundColor = .white
        dizelButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        dizelKatkılıButton.backgroundColor = .white
        dizelKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        lpgButton.backgroundColor = .white
        lpgButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        viewModel?.isBenzin = true
        viewModel?.isKatkılıBenzin = false
        viewModel?.isKatkılıDizel = false
        viewModel?.isDizel = false
        viewModel?.isLPG = false
    }
    
    @IBAction func benzinKatkılıButtonTapped(_ sender: Any) {
        benzinButton.backgroundColor = .white
        benzinButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        benzinKatkılıButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        benzinKatkılıButton.tintColor = .white
        
        dizelButton.backgroundColor = .white
        dizelButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        dizelKatkılıButton.backgroundColor = .white
        dizelKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        lpgButton.backgroundColor = .white
        lpgButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        viewModel?.isBenzin = false
        viewModel?.isKatkılıBenzin = true
        viewModel?.isKatkılıDizel = false
        viewModel?.isDizel = false
        viewModel?.isLPG = false
    }
    
    @IBAction func dizelButtonTapped(_ sender: Any) {
        dizelButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        dizelButton.tintColor = .white

        benzinButton.backgroundColor = .white
        benzinButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        benzinKatkılıButton.backgroundColor = .white
        benzinKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        dizelKatkılıButton.backgroundColor = .white
        dizelKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
    
        lpgButton.backgroundColor = .white
        lpgButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        viewModel?.isBenzin = false
        viewModel?.isKatkılıBenzin = false
        viewModel?.isKatkılıDizel = false
        viewModel?.isDizel = true
        viewModel?.isLPG = false
    }
    
    @IBAction func dizelKatkılıButtonTapped(_ sender: Any) {
        dizelButton.backgroundColor = .white
        dizelButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)

        benzinButton.backgroundColor = .white
        benzinButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        benzinKatkılıButton.backgroundColor = .white
        benzinKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        dizelKatkılıButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        dizelKatkılıButton.tintColor = .white
    
        lpgButton.backgroundColor = .white
        lpgButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        viewModel?.isBenzin = false
        viewModel?.isKatkılıBenzin = false
        viewModel?.isKatkılıDizel = true
        viewModel?.isDizel = false
        viewModel?.isLPG = false
    }
        
    
    @IBAction func lpgButtonTapped(_ sender: Any) {
        dizelButton.backgroundColor = .white
        dizelButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)

        benzinButton.backgroundColor = .white
        benzinButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        benzinKatkılıButton.backgroundColor = .white
        benzinKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        
        dizelKatkılıButton.backgroundColor = .white
        dizelKatkılıButton.tintColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
    
        lpgButton.backgroundColor = UIColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        lpgButton.tintColor = .white
        
        viewModel?.isBenzin = false
        viewModel?.isKatkılıBenzin = false
        viewModel?.isKatkılıDizel = false
        viewModel?.isDizel = false
        viewModel?.isLPG = true
        
    }
    
    @IBAction func uygulaButtonTapped(_ sender: Any) {
        //toScreen(screenId: "Main", storyboardName: "Main")
        
        let vm = HomePageVM()
        
        let vc = ViewController.instantiate(viewModel: vm) as! ViewController
      /*  vm.vmm = viewModel
        vm.mapLocation = viewModel?.mapLocation
        vm.isfilter = viewModel?.isfilter ?? false
        vm.isDizel = viewModel?.isDizel ?? false
        vm.isLPG = viewModel?.isLPG ?? false
        print(viewModel?.isLPG)
        print(vm.isLPG)
        vm.isBenzin = viewModel?.isBenzin ?? false
        vm.isKatkılıDizel = viewModel?.isKatkılıDizel ?? false
        vm.isKatkılıBenzin = viewModel?.isKatkılıBenzin ?? false
       */
        vc.setFilter(isDizel: viewModel!.isDizel, isLPG: viewModel!.isLPG, isBenzin: viewModel!.isBenzin, isDizelKatkılı: viewModel!.isKatkılıDizel, isbenzinKatkılı: viewModel!.isKatkılıBenzin )
       
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
        
    }
}
extension FilterVC{
    
    func setButton(button: UIButton){
        button.layer.cornerRadius = 12.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = CGColor(red: 0.53, green: 0.73, blue: 0.78, alpha: 1.00)
        button.layer.shadowColor = CGColor(gray: 0.3, alpha: 0.5)
        
    }
    
}
extension FilterVC: StoryboardInstantiable {
    public static var storyboardName: String { return "FilterView" }
    public static var storyboardIdentifier: String? { return "FilterView" }
}

