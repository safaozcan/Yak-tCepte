//
//  PasswordResetVC.swift
//  GassApp
//
//  Created by Safa özcan on 18.07.2022.
//

import Foundation
import UIKit
class PasswordResetVc: BaseViewController<PassWordResetVM>{
    
    override func viewDidLoad() {
        setTextField(textField: newPasswordTextField,placeHolder: "New Password")
        setTextField(textField: passwordAgainTextField, placeHolder: "Password Again")
        
        
    }
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var smallTitle: UILabel!
    
    
    @IBAction func newPassword(_ sender: Any) {
    }
    
    @IBAction func passWordAgain(_ sender: Any) {
        //check if the password are same
    }
    
    @IBAction func saveNewPassword(_ sender: Any) {
        //post the new password with API
        let alertController = UIAlertController(title: "", message: "Your password has been changed.", preferredStyle: .actionSheet)
        let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
               alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        toScreen(screenId: "Main", storyboardName: "Main")

    }
    
    
    
}
