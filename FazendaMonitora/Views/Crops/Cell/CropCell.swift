//
//  CropCell.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/6/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class CropCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var moistLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellForCrop(crop: CropsModel){
        iconImageView.image = crop.thumbnail
        nameLabel.text = crop.name
        switch crop.state {
        case 1:
            statusLabel.text = "Status: OK"
            statusLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
        case 2:
            statusLabel.text = "Status: Medium"
            statusLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
        case 3:
            statusLabel.text = "Status: Critical"
            statusLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
        default:
            statusLabel.text = "Status: N/A"
            statusLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            print("State not recognized: \(crop.state)")
        }
        moistLabel.text = "Umidade: \(crop.moisture)%"
        tempLabel.text = "Temperatura: \(crop.temperature)ºC"
        
        //Paint the labels
        if(crop.moisture > 80){
            moistLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
        } else if (crop.moisture >= 70 && crop.moisture <= 80) {
            moistLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
        } else {
            moistLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
        }
        
        if(crop.temperature <= 36.0){
            tempLabel.textColor = UIColor(red: 0.2235, green: 0.7922, blue: 0.4549, alpha: 1.0)
        } else if (crop.temperature > 36.0 && crop.temperature <= 38.0) {
            tempLabel.textColor = UIColor(red: 0.9922, green: 0.7529, blue: 0.1843, alpha: 1.0)
        } else {
            tempLabel.textColor = UIColor(red: 0.8863, green: 0.1294, blue: 0.1725, alpha: 1.0)
        }
        
    }
}
