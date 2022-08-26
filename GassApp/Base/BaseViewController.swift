//
//  BaseViewController.swift
//  GassApp
//
//  Created by Safa özcan on 20.07.2022.
//

import Foundation
import UIKit
/*protocol ViewControllerProtocol: AnyObject {
    // swiftlint:disable:next type_name
    associatedtype T
    init(viewModel: T)
}*/
class BaseViewController<U>: UIViewController {
        typealias T = U
        var viewModel: T?
    
    
    
   
    
    //var parameter:BaseParameter?
    
   
    func
    setTextField(textField: UITextField, placeHolder: String) {
        textField.layer.cornerRadius = 18.0
        
        textField.layer.borderWidth = 0.0
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.textAlignment = NSTextAlignment.center
        textField.backgroundColor = .white
        textField.tintColor = .gray
        let placeholderText = NSAttributedString(string: placeHolder,
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
                
        textField.attributedPlaceholder = placeholderText
        
    }
    
   
    
    func toScreen(screenId:String, storyboardName: String){
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: storyboardName, bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier:screenId)
           
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
            
           
        }
    }
    
    /*func popScreen(){
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }*/
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func alert(message:String?){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Uyarı!", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func homePageCustomAlert(message: String) {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Merhaba", message: "kayıtlı \(message) görmek için giriş yapmalısınız.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Giriş yap", style: UIAlertAction.Style.default, handler: //{ action inself.toScreen(screenId: "LogInView", storyboardName: "LogInView", viewModel: LogInViewModel)}
                                     nil))
        alert.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel, handler: nil))
            
            
        self.present(alert, animated: true, completion: nil)
        
        
        }

    }


}
func serverResponse<T>(result:Result<T, APIError>) -> T?{
        switch result {
        case .failure(let error):
            print(error)
        //    alert(message: "Bir hata ile karşılaşıldı!")
            break;
        case .success(let response):
                return response
        }

        return nil
    }

    
