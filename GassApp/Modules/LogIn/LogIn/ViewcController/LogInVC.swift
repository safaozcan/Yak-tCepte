//
//  LogInVC.swift
//  GassApp
//
//  Created by Safa özcan on 7.07.2022.
//

import Foundation
import UIKit
final class LogInVC: BaseViewController<LogInViewModel>{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField(textField: passwordTextField,placeHolder: "Şifre")
        setTextField(textField: emailTextField,placeHolder: "Email")
        
        hideKeyboardWhenTappedAround()
        
        viewModel?.logInPageDataLoaded = { [weak self] in
            DispatchQueue.main.async {
                let vm = HomePageVM()
                let vc = ViewController.instantiate(viewModel: vm)
                vc.modalPresentationStyle = .fullScreen
                self!.present(vc, animated: true)
            }
        }
        
        viewModel?.loginAlert = { [weak self] in
            self?.alert(message: "Böyle bir kullanıcı bulunamadı. Lütfen tekrar deneyiniz.")
        }
        
        logInButon.layer.cornerRadius = 18.0
        logInButon.clipsToBounds = true

        
        
    }

    @IBOutlet private weak var logInButon: UIButton!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var smallTitle: UILabel!
    @IBOutlet private weak var pageTitle: UILabel!
    
    @IBAction private func goBack(_ sender: Any) {
        let vm = HomePageVM()
        let vc = ViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
  

    @IBAction private func signUpTapped(_ sender: Any) {
        
        let vm = SignUpViewModel()
        let vc = SignUpVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }

   
    @IBAction private func logIn(_ sender: Any) {
        viewModel?.logInUser(email: emailTextField.text!, password: passwordTextField.text!)

    }
    
    
}
extension LogInVC: StoryboardInstantiable {
    public static var storyboardName: String { return "LogInView" }
    public static var storyboardIdentifier: String? { return "LogInView" }
}

