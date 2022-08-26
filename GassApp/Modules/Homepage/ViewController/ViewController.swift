//
//  ViewController.swift
//  GassApp
//
//  Created by Safa özcan on 5.07.2022.
//

import UIKit
import MapKit
import CoreLocation
import GooglePlaces

class ViewController: BaseViewController<HomePageVM> , MKMapViewDelegate, CLLocationManagerDelegate {
    
    let annotation = MKPointAnnotation()
    var currentLocation: CLLocationCoordinate2D?
    var isUserLoggedIn: Bool?
    let locationManager = CLLocationManager()
    var homePageVM = HomePageVM()
    var indx : Int = 0
    
    
    func setFilter(isDizel : Bool, isLPG: Bool,isBenzin: Bool,isDizelKatkılı: Bool,isbenzinKatkılı: Bool){
        homePageVM.isDizel = isDizel
        homePageVM.isLPG = isLPG
        homePageVM.isBenzin = isBenzin
        homePageVM.isKatkılıBenzin = isbenzinKatkılı
        homePageVM.isKatkılıDizel = isDizelKatkılı
    }
    
    @IBOutlet private weak var plusImageView: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapView.delegate = self
        
        
        hideKeyboardWhenTappedAround()
        
        configureLocationServices()
        
        let usr = UserDefaults.standard
        let isUser = usr.string(forKey: "ACCESS_TOKEN") ?? ""
        
        if isUser == ""{
            isUserLoggedIn = false
        }
        else{
            isUserLoggedIn = true
        }
        
        multipleButtonViewContainer.backgroundColor = UIColor.clear
        multipleButtonViewContainer.isHidden = true
        
        homePageVM.loadStations(lat: currentLocation?.latitude ?? 39.80, lng: currentLocation?.longitude ?? 32.64)
        
        homePageVM.updateMap = { [weak self] in
            DispatchQueue.main.async {
               
            
                
                self?.addStationsToMapView()
            }
            
        }
        
    }
    @IBAction private func searchBarClicked(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
            autocompleteController.delegate = self

            // Specify the place data types to return.
            let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
              UInt(GMSPlaceField.coordinate.rawValue))
            autocompleteController.placeFields = fields
        
        
            // Specify a filter.
            let filter = GMSAutocompleteFilter()
            filter.type = .noFilter
            filter.country = "TR"
                    
            autocompleteController.autocompleteFilter = filter

            // Display the autocomplete view controller.
            present(autocompleteController, animated: true, completion: nil)
    
    }

    
    private func addStationsToMapView(){
        
        let itemCount = (homePageVM.stations?.count ?? 1) - 1
         if itemCount >= 0{
        let count = 0...itemCount
             for index in count {
            
                let pin = MKPointAnnotation()
                pin.coordinate = CLLocationCoordinate2D(latitude: (homePageVM.stations?[index].lat)!, longitude: (homePageVM.stations?[index].lng)!)
                pin.title = homePageVM.stations?[index].brand
                 
                 if ((homePageVM.isLPG) ) {
                    pin.subtitle = String((homePageVM.stations?[index].lpgPrice)!)
                }
                else if ((homePageVM.isBenzin)) {
                    pin.subtitle = String((homePageVM.stations?[index].gasolinePrice)!)
                }
                else if ((homePageVM.isDizel) ) {
                    pin.subtitle = String((homePageVM.stations?[index].dieselPrice)!)
                }
                else if ((homePageVM.isKatkılıBenzin)) {
                    pin.subtitle = String((homePageVM.stations?[index].gasolineKatkiliPrice)!)
                }
                else if ((homePageVM.isKatkılıDizel) ) {
                    pin.subtitle = String((homePageVM.stations?[index].dieselKatkiliPrice)!)
                }
                else{pin.subtitle = String((homePageVM.stations?[index].gasolinePrice)!)}
                
                self.mapView.addAnnotation(pin)
                 print(pin)
            }
             
         }
        
    }
    private func configureLocationServices() {
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        beginLocationUpdates(locationManager: locationManager)
        
    }
    private func beginLocationUpdates(locationManager: CLLocationManager) {
            
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        //homePageVM.isfilter
        if false {
            currentLocation = homePageVM.mapLocation
        }
        else {
            currentLocation = locationManager.location?.coordinate
        }
        
        let span = MKCoordinateSpan(latitudeDelta: 0.11, longitudeDelta: 0.11)
        let region = MKCoordinateRegion(center: currentLocation ?? CLLocationCoordinate2D(latitude: 39.90, longitude: 32.80), span: span)
        mapView.setRegion(region, animated: false)
    }
    
    private func loadStationSearch(coordinate: CLLocationCoordinate2D){
        homePageVM.loadStations(lat: coordinate.latitude, lng: coordinate.longitude)
        mapView.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000), animated: true)
    }
    @IBOutlet private weak var mapView: MKMapView!
    var mapCamera = MKMapCamera()
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
                beginLocationUpdates(locationManager: manager)}
        }
    
    @IBAction func locationButtonTapped(_ sender: Any) {

        //currentLocation = locationManager.location?.coordinate
        mapView.setRegion(MKCoordinateRegion(center: currentLocation!, latitudinalMeters: 3000, longitudinalMeters: 3000), animated: true)
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       //let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        //let span = MKCoordinateSpan(latitudeDelta: 0.21, longitudeDelta: 0.21)
        //let region = MKCoordinateRegion(center: location, span: span)
        //mapView.setRegion(region, animated: false)
        
       
        
       // print(locations[0].coordinate.latitude)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let vm = HomePageVM()
        let vc = BottomSheetVC.instantiate(viewModel: vm) as! BottomSheetVC
      //  vm.indexForBottomSheet = view.tagg
        //print(view.tag)
        let customView = view as! MyCustomAnnotation
        vm.stations = homePageVM.stations
        vm.station = homePageVM.stations?[customView.indexx ?? 0 ]

        vc.sheetPresentationController?.detents = [.medium()]
        self.present(vc, animated: true)
    }
    //func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {}

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

                    //  Don't want to show a custom image if the annotation is the user's location.
                    if (annotation is MKUserLocation) {
                        return nil
                    } else {
                        
                        let annotationIdentifier = "AnnotationIdentifier"
                        let nibName = "MyCustomAnnotation"
                        let viewFromNib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as! MyCustomAnnotation
                        var annotationView: MyCustomAnnotation?

                        // if there is a view to be dequeued, use it for the annotation
                        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MyCustomAnnotation {

                            if dequeuedAnnotationView.subviews.isEmpty {
                                dequeuedAnnotationView.addSubview(viewFromNib)
                            }
                            
                            annotationView = dequeuedAnnotationView
                            annotationView?.annotation = annotation
                            
                        } else {

                            // if no views to dequeue, create an Annotation View
                            let av = MyCustomAnnotation(annotation: annotation, reuseIdentifier: annotationIdentifier)
                            av.addSubview(viewFromNib)
                            annotationView = av     // extend scope to be able to return at the end of the func
                        }

                        // after we manage to create or dequeue the av, configure it
                        if let annotationView = annotationView {
                            annotationView.canShowCallout = false                                    // callout bubble
                            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                            annotationView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
                            
                            let customView = annotationView.subviews.first as! MyCustomAnnotation
                            customView.frame = annotationView.frame
                            //write the desired price
                            
                            if (annotationView.annotation?.title) == "BP" || (annotationView.annotation?.title) == "bp"  {
                                customView.BrandIcon.image = UIImage(named:"BP")
                            }
                            else if (annotationView.annotation?.title) == "Shell" || (annotationView.annotation?.title) == "shell"  {
                                customView.BrandIcon.image = UIImage(named:"Shell")
                            }
                            else if (annotationView.annotation?.title) == "Kadoil" || (annotationView.annotation?.title) == "kadoil"  {
                                customView.BrandIcon.image = UIImage(named:"Kadoil")
                            }
                            else if (annotationView.annotation?.title) == "Aygaz" || (annotationView.annotation?.title) == "aygaz"  {
                                customView.BrandIcon.image = UIImage(named:"Aygaz")
                            }
                            else if (annotationView.annotation?.title) == "Mogaz" || (annotationView.annotation?.title) == "mogaz"  {
                                customView.BrandIcon.image = UIImage(named:"Mogaz")
                            }
                            else if (annotationView.annotation?.title) == "PetrolOfisi" || (annotationView.annotation?.title) == "petrolofisi"  {
                                customView.BrandIcon.image = UIImage(named:"PO")
                            }
                            else if (annotationView.annotation?.title) == "Aytemiz" || (annotationView.annotation?.title) == "aytemiz"  {
                                customView.BrandIcon.image = UIImage(named:"Aytemiz")
                            }
                            else if (annotationView.annotation?.title) == "Opet" || (annotationView.annotation?.title) == "opet"  {
                                customView.BrandIcon.image = UIImage(named:"Opet")
                            }
                            else if (annotationView.annotation?.title) == "Total" || (annotationView.annotation?.title) == "total"  {
                                customView.BrandIcon.image = UIImage(named:"Total")
                            }
                            else if (annotationView.annotation?.title) == "Go" || (annotationView.annotation?.title) == "go"  {
                                customView.BrandIcon.image = UIImage(named:"GO")
                            }
                            else {
                                customView.BrandIcon.image = UIImage(named: "DefaultGasStation")
                            }
                            customView.priceLabel.text = (annotationView.annotation?.subtitle)!
                            
                            customView.frame = annotationView.frame
                            
                            //customView.indexx = self.indx
                            print(customView.index)
                            //self.indx = self.indx + 1

                            print(annotationView)
                            return customView
                        }

                 /*       if viewModel?.isAygaz ?? false && (annotationView?.annotation?.title) == "Aygaz" {
                                return annotationView
                            }
                        if viewModel?.isOpet ?? false && (annotationView?.annotation?.title) == "Opet" {
                                return annotationView
                            }
                        else{
                  */
                        annotationView?.indexx = self.indx
                        self.indx = self.indx + 1
                            return nil
                    //    }
                        
                        }
                       
                    }


    @IBAction private func toMoreOptions(_ sender: Any) {
        
        if isUserLoggedIn!{
            if plusImageView.image != UIImage(named:"PlusTapped") {
                plusImageView.image = UIImage(named:"PlusTapped")
                multipleButtonViewContainer.isHidden = false
            }
            else{plusImageView.image = UIImage(named:"HomePagePlusIcon")
                multipleButtonViewContainer.isHidden = true
            }
            
        }
        
        else{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Merhaba", message: "Adres, araç ve istasyon eklemek ya da eklediklerinizi görmek için giriş yapmalısınız", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Giriş yapmak istiyorum ", style: UIAlertAction.Style.default, handler: { action in
                    let vm = LogInViewModel()
                    let vc = LogInVC.instantiate(viewModel: vm)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
        
                                  }))
                alert.addAction(UIAlertAction(title: "İptal", style: UIAlertAction.Style.cancel, handler: nil))
        
        
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    @IBOutlet private weak var HomePageMultipleButton: UIImageView!
    @IBOutlet private weak var multipleButtonViewContainer: UIView!
    
    @IBAction private func favStationsButtonTapped(_ sender: Any) {
        
        let vm = FavoriteStationsVM()
        let vc = FavoriteStationsVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    
    }
    @IBAction private func addressButtonTapped(_ sender: Any) {
        
        let vm = AddressVM()
        let vc = AddressVC.instantiate(viewModel: vm)
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction private func vehicleButtonTapped(_ sender: Any) {
        
        let vm = VehicleShowVM()
        let vc = VehicleShowVC.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

    @IBAction private func toProfile(_ sender: Any) {
        if isUserLoggedIn ?? false  {
            let vm = ProfileVM()
            let vc = ProfileVC.instantiate(viewModel: vm)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        else{
            let vm = LogInViewModel()
            let vc = LogInVC.instantiate(viewModel: vm)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    

    @IBAction private func toFilter(_ sender: Any) {
        let vm = HomePageVM()
        let vc = FilterVC.instantiate(viewModel: vm)
        vm.mapLocation = currentLocation
        vm.isfilter = true
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
        
        
    }
    
}
extension ViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
      print(place.coordinate)
      
      
      loadStationSearch(coordinate: place.coordinate)
    
    dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

}


      
      
extension ViewController: StoryboardInstantiable {
    public static var storyboardName: String { return "Main" }
    public static var storyboardIdentifier: String? { return "Main" }
}
extension MKAnnotation{
   
    
}
