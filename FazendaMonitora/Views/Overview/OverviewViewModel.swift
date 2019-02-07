//
//  OverviewViewModel.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/6/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation

class OverviewViewModel: RequestDelegate {
    let requestHandler = RequestMaker()
    var controller: OverviewViewController
    var cropsArray = [CropsModel]()
    
    init(viewController: OverviewViewController){
        controller = viewController
        
        requestHandler.delegate = self
        requestHandler.requestCrops()
    }
    
    func didLoadCrops(crops: [CropsModel]) {
        cropsArray = crops
        controller.didLoadCrops()
    }
    
    func didFailToLoadCrops(withError error: Error) {
        controller.loadingCropsFailed()
    }
}
