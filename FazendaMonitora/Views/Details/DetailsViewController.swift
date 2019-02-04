//
//  DetailsViewController.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/4/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.mapType = MKMapType.satellite
        let location = CLLocation(latitude: -22.847319, longitude: -47.087693)
        let radius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setCenter(location.coordinate, animated: true)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
