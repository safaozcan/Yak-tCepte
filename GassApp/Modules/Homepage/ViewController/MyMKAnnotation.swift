//
//  MyMKAnnotation.swift
//  GassApp
//
//  Created by Safa özcan on 21.08.2022.
//

import Foundation
import MapKit
class MyMKAnnotation : MKAnnotation{
    init?() {
        return nil
    }
    var coordinate: CLLocationCoordinate2D
    var tagg: Int?
    func isEqual(_ object: Any?) -> Bool {
        return false
    }
    
    var hash: Int = 0
    
    var superclass: AnyClass?
    
    func `self`() -> Self {
        return self
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        return nil
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        return nil
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        return nil
    }
    
    func isProxy() -> Bool {
        return false
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        return false
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        return false
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        return false
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        return false
    }
    
    var description: String = ""
    
    
    
    
}
