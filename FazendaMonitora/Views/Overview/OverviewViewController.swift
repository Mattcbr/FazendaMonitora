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
    @IBOutlet weak var statusIconImageView: UIImageView!
    @IBOutlet weak var statusDescriptionLabel: UILabel!
    
    var model: OverviewViewModel?
    
    var OKStatusQuantity: Int = 0
    var MEDIUMStatusQuantity: Int = 0
    var CRITICALStatusQuantity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = OverviewViewModel(viewController: self)
        
        setButtonsLabels()
        setOtherElements()
    }
    
    func setButtonsLabels(){
        if(model?.cropsArray.count == 0){
            okStatusButton.setTitle("Loading...", for: .normal)
            mediumStatusButton.setTitle("Loading...", for: .normal)
            criticalStatusButton.setTitle("Loading...", for: .normal)
        } else {
            okStatusButton.setTitle("\(OKStatusQuantity)\nStatus Ok", for: .normal)
            mediumStatusButton.setTitle("\(MEDIUMStatusQuantity)\nStatus Médio", for: .normal)
            criticalStatusButton.setTitle("\(CRITICALStatusQuantity)\nStatus Critico", for: .normal)
        }
        
        okStatusButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        mediumStatusButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        criticalStatusButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        okStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
        mediumStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
        criticalStatusButton.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    func setOtherElements(){
        if(model?.cropsArray.count == 0){
            statusIconImageView.image = UIImage(named: "Icon")
            statusDescriptionLabel.textColor = .black
            statusDescriptionLabel.text = "Loading Information..."
        } else {
            let mediumPercentage: Float = Float(MEDIUMStatusQuantity)/Float((model?.cropsArray.count)!)
            if (CRITICALStatusQuantity > 0){
                statusIconImageView.image = UIImage(named: "Red")
                statusDescriptionLabel.text = "Você tem pontos que requerem ações imediatas"
                statusDescriptionLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
            } else if (mediumPercentage > 0.3) {
                statusIconImageView.image = UIImage(named: "Yellow")
                statusDescriptionLabel.text = "Muitos pontos podem requerer ações em breve"
                statusDescriptionLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
            } else {
                statusIconImageView.image = UIImage(named: "Green")
                statusDescriptionLabel.text = "Tudo está bem na sua lavoura"
                statusDescriptionLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Overview"
    }
    
    @IBAction func didPressStatusButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
    
    func didLoadCrops(){
        getStatusQuantities()
        setButtonsLabels()
        setOtherElements()
    }
    
    func loadingCropsFailed(){
        
    }
    
    func getStatusQuantities(){
        OKStatusQuantity = model?.cropsArray.filter{ $0.state == 1 }.count ?? 0
        MEDIUMStatusQuantity = model?.cropsArray.filter{ $0.state == 2 }.count ?? 0
        CRITICALStatusQuantity = model?.cropsArray.filter{ $0.state == 3 }.count ?? 0
    }
}
