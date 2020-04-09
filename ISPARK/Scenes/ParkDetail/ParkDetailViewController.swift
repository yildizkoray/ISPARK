//
//  ParkMapViewController.swift
//  ISPARK
//
//  Created by Koray Yildiz on 28.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import MapKit

fileprivate struct Constant {
    
    static let latitudeDelta: Double = 0.007
    static let longtitude: Double = 0.007
}

public final class ParkMapViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var map: MKMapView!
    private var locationManager: CLLocationManager!
    
    public var viewModel: ParkMapViewModel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        prepareAnnotation()
        prepareLocationManager()
        prepareNavigation()
    }
    
    private func prepareAnnotation() {
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: viewModel.display.latitude,
                                                      longitude: viewModel.display.longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = viewModel.display.title
        map.addAnnotation(annotation)
    }
    
    private func prepareLocationManager() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func prepareNavigation() {
        title = viewModel.display.title
    }
}

// MARK: - CLLocationManagerDelegate

extension ParkMapViewController: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let center = CLLocationCoordinate2D(latitude: viewModel.display.latitude, longitude: viewModel.display.longitude)
        let region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: Constant.latitudeDelta, longitudeDelta: Constant.longtitude))
        
        self.map.setRegion(region, animated: true)
        
        
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
}

// MARK: - MKMapViewDelegate

extension ParkMapViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Clicked annotation view: \(viewModel.display.title)")
    }
}

