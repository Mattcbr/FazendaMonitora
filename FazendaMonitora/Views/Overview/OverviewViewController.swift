//
//  OverviewViewController.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/4/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {

    @IBOutlet weak var criticalStatusButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        criticalStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
    }
    

    @IBAction func didPressStatusButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
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
