//
//  Mapvc.swift
//  localtask
//
//  Created by trioangle on 13/03/24.
//

import UIKit
import MapKit
import CoreLocation

class Mapvc: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager : CLLocationManager!
    
    
    @IBOutlet weak var closebtn: UIButton!
    
    class func initWithStory() -> Mapvc {
        let view: Mapvc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Mapvc") as? Mapvc)!
     
   
        return view
    }
    
    @IBAction func closebtnaction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request permission to access the user's location
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        closebtn.setTitle("", for: .normal)
        // Set up the map view to show the user's location
        mapView.showsUserLocation = true
        mapView.delegate = self
//        let initialLocation = CLLocation(latitude: 40.7128, longitude: -74.0060)
//               centerMapOnLocation(location: initialLocation)
     
    }
    
    // MARK: - CLLocationManagerDelegate
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            locationManager.startUpdatingLocation()
//        }
//    }


    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
             if status == .authorizedWhenInUse || status == .authorizedAlways {
                 locationManager.startUpdatingLocation()
             }
         }
         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
             guard let location = locations.last else { return }
             let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
             
             print("currentlatitude \(location.coordinate.latitude)")
             print("currentlongitude \(location.coordinate.longitude)")
             mapView.setRegion(region, animated: true)
         }
         
         // CLLocationManagerDelegate method to handle location manager errors
         func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
             print("Location manager failed with error: \(error)")
         }
}
