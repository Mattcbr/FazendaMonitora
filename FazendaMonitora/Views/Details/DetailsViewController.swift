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
    
    @IBOutlet weak var cropNameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var moistLabel: UILabel!
    
    var crop: CropsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupMap()
        
    }
    
    func setupLabels(){
        cropNameLabel.text = crop!.name
        switch crop!.state {
        case 1:
            statusLabel.text = "Status: OK"
            statusLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
        case 2:
            statusLabel.text = "Status: Medium"
            statusLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
        case 3:
            statusLabel.text = "Status: Crítico"
            statusLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
        default:
            statusLabel.text = "Status: N/A"
            statusLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            print("State not recognized: \(crop!.state)")
        }
        moistLabel.text = "Umidade: \(crop!.moisture)%"
        tempLabel.text = "Temperatura: \(crop!.temperature)ºC"
        
        //Paint the labels
        if(crop!.moisture > 80){
            moistLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
        } else if (crop!.moisture >= 70 && crop!.moisture <= 80) {
            moistLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
        } else {
            moistLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
        }
        
        if(crop!.temperature <= 36.0){
            tempLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
        } else if (crop!.temperature > 36.0 && crop!.temperature <= 38.0) {
            tempLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
        } else {
            tempLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
        }
        
    }
    
    func setupMap(){
        mapView.mapType = MKMapType.satellite
        let location = CLLocation(latitude: crop!.latitude, longitude: crop!.longitude)
        let radius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setCenter(location.coordinate, animated: true)
    }
}
