//
//  RequestMaker.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/6/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestDelegate: class{
    func didLoadCrops(crops:[CropsModel] )
    func didFailToLoadCrops(withError error: Error)
}

class RequestMaker {
    
    weak var delegate: RequestDelegate?
    let responseParser = Parser.shared
    
    func requestCrops() {
        let requestURL = "https://fazendamonitora.firebaseio.com/crops.json"
        
        Alamofire.request(requestURL).responseJSON{ response in
            switch response.result{
                
            case .success(let JSON):
                let cropsArray = self.responseParser.parseCrops(response: JSON)
                self.delegate?.didLoadCrops(crops: cropsArray)
            case .failure(let error):
                self.delegate?.didFailToLoadCrops(withError: error)
            }
        }
    }
}
