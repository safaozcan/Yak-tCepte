//
//  HomePageVC.swift
//  GasApp
//
//  Created by Safa özcan on 4.07.2022.
//

import Foundation
import MapKit
import UIKit

class HomePageVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var profile: UIImageView!
    

    @IBOutlet weak var mapView: MKMapView!

    //var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("safa")
        print("safa")
    
        //mapView.delegate = self
        //locationManager.delegate = self
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.requestWhenInUseAuthorization()
        //locationManager.startUpdatingLocation()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locations[0].coordinate.latitude
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
       

        
        mapView.setRegion(MKCoordinateRegion(center: location,
                                             span: MKCoordinateSpan(latitudeDelta: 0.2,
                                                                    longitudeDelta: 0.2 )),
                          animated: true)
       
        
    }*/
    
    @IBAction func toCustomView(_ sender: Any) {
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)

        //let customViewController = storyboard.instantiateViewController(withIdentifier: "CustomViewController") as!CustomViewController
    }
  
    @IBAction func toProfile(_ sender: Any) {
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)

        //let customViewController = storyboard.instantiateViewController(withIdentifier: "CustomViewController") as!CustomViewController
    }
    
    @IBAction func toFilter(_ sender: Any) {
        
    }
}
//extension HomePageVC: MKMapViewDelegate {}

//extension HomePageVC: CLLocationManagerDelegate {}
