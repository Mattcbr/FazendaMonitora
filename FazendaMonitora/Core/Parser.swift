//
//  Parser.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/6/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation

class Parser {
    static let shared = Parser()
    var cropsArray = [CropsModel] ()
    
    func parseCrops(response: Any) -> [CropsModel] {
        let JSONresponse = response as? [[String : Any]]
        
        JSONresponse?.forEach{ cropInfo in
            
            let latitude = cropInfo["latitude"] as? Double ?? 1000.0
            let longitude = cropInfo["longitude"] as? Double ?? 1000.0
            let moisture = cropInfo["moisture"] as? Int ?? 0
            let name = cropInfo["name"] as? String ?? "Default"
            let state = cropInfo["state"] as? Int ?? 0
            let temperature = cropInfo["temperature"] as? Double ?? 1000.0
            
            let newCrop = CropsModel(lat: latitude,
                                     long: longitude,
                                     moist: moisture,
                                     newName: name,
                                     stt: state,
                                     temp: temperature)
            cropsArray.append(newCrop)
        }
        return cropsArray
    }
}
