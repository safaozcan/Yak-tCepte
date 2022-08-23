//
//  MyCustomAnnotation.swift
//  GassApp
//
//  Created by Safa özcan on 16.08.2022.
//

import Foundation
import MapKit
import UIKit

class MyCustomAnnotation : MKAnnotationView{
    //var tagg: Int?
    var indexx: Int?
    var lpgPrice : Double?
    var gasolinePrice : Double?
    var gasolineKatkiliPrice : Double?
    var dieselPrice : Double?
    var dieselKatkiliPrice : Double?
    
    
override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
 
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
}
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
 
    @IBOutlet weak var annotationImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var BrandIcon: UIImageView!
   


}
