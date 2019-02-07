//
//  CropsViewModel.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/6/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation

class CropsViewModel {
    var controller: CropsViewController?
    let sharedParser = Parser.shared
    var cropsArray = [CropsModel]()
    
    init(viewController: CropsViewController) {
        self.controller = viewController
        cropsArray = sharedParser.cropsArray
        cropsArray.sort(by: {$0.state > $1.state})
        controller!.updateCrops()
    }
}
