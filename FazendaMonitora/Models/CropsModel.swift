//
//  CropsModel.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/6/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation
import UIKit

class CropsModel {
    var thumbnail : UIImage
    let latitude : Double
    let longitude : Double
    let moisture : Int
    let name : String
    let state : Int
    let temperature : Double
    
    
    init(lat: Double, long: Double, moist: Int, newName: String, stt: Int, temp: Double) {
        self.latitude = lat
        self.longitude = long
        self.moisture = moist
        self.name = newName
        self.state = stt
        self.temperature = temp
        
        if(newName.hasPrefix("Lettuce")){
            self.thumbnail = UIImage(named: "lettuce-1")!
        } else if(newName.hasPrefix("Carrot")){
            self.thumbnail = UIImage(named: "carrot")!
        } else if(newName.hasPrefix("Cabbage")){
            self.thumbnail = UIImage(named: "cabbage")!
        } else if(newName.hasPrefix("Watermelon")){
            self.thumbnail = UIImage(named: "watermelon")!
        } else {
            self.thumbnail = UIImage(named: "Icon")!
        }
    }
}
