//
//  StoryboardInstantiable.swift
//  GassApp
//
//  Created by Safa özcan on 27.07.2022.
//

import Foundation
import UIKit
public protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
}

extension StoryboardInstantiable{
   
    
  //  public static var storyboardName: String? {return nil}
    public static var storyboardIdentifier: String? { return nil }
    public static var storyboardBundle: Bundle? { return nil }

    static func instantiate<T: ViewModel>(viewModel: T) -> BaseViewController<T> {
            let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: BaseViewController<T>.self))

            if let storyboardIdentifier = storyboardIdentifier {
                // swiftlint:disable:next force_cast
                let vc = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! BaseViewController<T>
                vc.viewModel = viewModel
                return vc
            } else {
                // swiftlint:disable:next force_cast
                let vc = storyboard.instantiateInitialViewController() as! BaseViewController<T>
                vc.viewModel = viewModel
                return vc
            }
        }
}
