//
//  CropsViewController.swift
//  FazendaMonitora
//
//  Created by Matheus Queiroz on 2/4/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class CropsViewController: UITableViewController {

    var model: CropsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = CropsViewModel(viewController: self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Lista detalhada"
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: false)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model?.cropsArray.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? CropCell else {
            fatalError("Not a crop cell")
        }

        let cropToSetup = self.model?.cropsArray[indexPath.row]
        cell.setCellForCrop(crop: cropToSetup!)

        return cell
    }

    func updateCrops(){
        self.tableView.reloadData()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! CropCell
        let indexPath = tableView.indexPath(for: cell)
        let selectedCrop = model?.cropsArray[(indexPath?.row)!]
        
        let destination = segue.destination as! DetailsViewController
        destination.crop = selectedCrop
    }
}
