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
    
    let locationManager = CLLocationManager()
    
    
    
    class func initWithStory() -> Mapvc {
        let view: Mapvc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Mapvc") as? Mapvc)!
     
   
        return view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request permission to access the user's location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
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
        switch status {
        case .notDetermined:
            // Request authorization
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            // Location services are disabled or denied by the user
            // Handle accordingly
            print("Location services disabled")
        case .authorizedWhenInUse, .authorizedAlways:
            // Location services are enabled
            // You can start updating location here if needed
            print("Location services enabled")
        @unknown default:
            break
        }
    }
    let regionRadius: CLLocationDistance = 1000 // 1km
    func centerMapOnLocation(location: CLLocation) {
         let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                   latitudinalMeters: regionRadius,
                                                   longitudinalMeters: regionRadius)
         mapView.setRegion(coordinateRegion, animated: true)
     }
     
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        // Center map on the user's current location
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        // Optionally, you can access latitude and longitude here
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        print("Latitude: \(latitude), Longitude: \(longitude)")
        
        // Stop updating location to save battery
        locationManager.stopUpdatingLocation()
    }
}
