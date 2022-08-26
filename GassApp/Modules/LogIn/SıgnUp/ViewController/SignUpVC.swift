//
//  SignUpVC.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit
class SignUpVC: BaseViewController<SignUpViewModel>{
    
    override func viewDidLoad() {
        setTextField(textField: emailTextField, placeHolder: "Email")
        setTextField(textField: passwordAgainTextField, placeHolder: "Şifre Tekrar")
        setTextField(textField: passwordTextField, placeHolder: "Şifre")
        setTextField(textField: nameTeztField, placeHolder: "İsim")
        setTextField(textField: surnameTextField, placeHolder: "Soy İsim")
        signUpButton.layer.cornerRadius = 18.0
        signUpButton.clipsToBounds = true
        hideKeyboardWhenTappedAround()
        
        viewModel?.signUpPageDataLoaded = { [weak self] in
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Merhaba", message: "Üye olma işleminiz başarıyla gerçekleşti.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Tamam", style: .default, handler: { action in
                    
                    let vm = LogInViewModel()
                    let vc = LogInVC.instantiate(viewModel: vm)
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                                              })
                    alertController.addAction(defaultAction)
                
                self?.present(alertController, animated: true, completion: nil)
                print("dataloaded")
            }

        }
        viewModel?.signUpAlert = { [weak self] in
            self?.alert(message: "Zaten kayıtlı olan bir mail adresi girdiniz. Lütfen farklı bir mail adresi ile tekrar deneyiniz.")
            
            
        }
    }
    
    
    
    
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var nameTeztField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var passwordAgainTextField: UITextField!
    @IBOutlet private weak var pageTitle: UILabel!
    @IBOutlet private weak var smallTitle: UILabel!

    @IBOutlet private weak var signUpButton: UIButton!
    
    @IBAction private func backToLogInPageClicked(_ sender: Any) {
        let vm = LogInViewModel()
        let vc = LogInVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    

    
    
    @IBAction private func signUp(_ sender: Any) {
        
       
        if passwordTextField.text != passwordAgainTextField.text{
            
            alert(message:  "Lüften aynı şifreyi giriniz.")
        }
        else{
        viewModel?.SignUpUser(email: emailTextField.text!, name: nameTeztField.text!, surname: surnameTextField.text!, password: passwordTextField.text!)
        }
        
        
    }
}
extension SignUpVC: StoryboardInstantiable {
    public static var storyboardName: String { return "SignUpView" }
    public static var storyboardIdentifier: String? { return "SignUpView" }
}
