//
//  ParkDetailViewController.swift
//  ISPARK
//
//  Created by Koray Yildiz on 28.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import MapKit

public final class ParkDetailViewController: UIViewController, Storyboarded {

  @IBOutlet private weak var map: MKMapView!
  private var locationManager: CLLocationManager!

  var item: ParkItem?

  override public func viewDidLoad() {
    super.viewDidLoad()

    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()

  }
}

extension ParkDetailViewController: CLLocationManagerDelegate {

  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let center = CLLocationCoordinate2D(latitude: (item?.latitude)!, longitude: (item?.longitude)!)
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
    self.map.setRegion(region, animated: true)

    let annotation = MKPointAnnotation()
    let centerCoordinate = CLLocationCoordinate2D(latitude: (item?.latitude)!, longitude: (item?.longitude)!)
    annotation.coordinate = centerCoordinate
    annotation.title = item?.name
    map.addAnnotation(annotation)
  }

  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("error:: \(error.localizedDescription)")
  }
}
