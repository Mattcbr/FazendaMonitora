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
    @IBOutlet weak var mediumStatusButton: UIButton!
    @IBOutlet weak var okStatusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonsLabels()
    }
    
    func setButtonsLabels(){
        okStatusButton.setTitle("70\nStatus Ok", for: .normal)
        mediumStatusButton.setTitle("29\nStatus Médio", for: .normal)
        criticalStatusButton.setTitle("1\nStatus Critico", for: .normal)
        
        okStatusButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        mediumStatusButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        criticalStatusButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        okStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
        mediumStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
        criticalStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Overview"
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
