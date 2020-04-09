//
//  ParkDetailViewController.swift
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

public final class ParkDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var map: MKMapView!
    private var locationManager: CLLocationManager!
    
    public var item: ParkItemDisplay?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLocationManager()
        prepareNavigation()
    }
    
    private func prepareNavigation() {
        title = item?.title
    }
    
    private func prepareLocationManager() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func annotation() {
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: (item?.latitude)!, longitude: (item?.longitude)!)
        annotation.coordinate = centerCoordinate
        annotation.title = item?.title
        map.addAnnotation(annotation)
    }
}

// MARK: - CLLocationManagerDelegate

extension ParkDetailViewController: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let item = item else { return }
        
        let center = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        let region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: Constant.latitudeDelta, longitudeDelta: Constant.longtitude))
        
        self.map.setRegion(region, animated: true)
        
        annotation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
}

