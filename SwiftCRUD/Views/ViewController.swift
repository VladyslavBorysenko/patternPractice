//
//  ViewController.swift
//  SwiftCRUD
//
//  Created by Владислав on 28.12.2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    
    var databaseRepositoty: IDatabaseRepository = FactoryDatabaseAccess.sharedFactory.createDatabaseInstance(database: .SQLite)
    var allParcels: [ParcelModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allParcels = databaseRepositoty.getAllParcels() ?? []
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseRepositoty.getAParcelsNumber() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KanjiListItem", for: indexPath) as! CustomTableViewCell
        
        cell.parcelIdLabel.text = "Parcel ID: " + String(allParcels[indexPath.row].idParcel)
        cell.parcelCostLabel.text = "Cost: " + String(allParcels[indexPath.row].cost)
        cell.parcelWeightLabel.text = "Weight: " + String(allParcels[indexPath.row].weight)
        cell.statusTitleLabel.text =  allParcels[indexPath.row].percelStatus.description
        cell.recipientIdLabel.text = "Recipient: " + String(allParcels[indexPath.row].recipient)
        
        return cell
    }
    
    
    //MARK: - IBaction
    @IBAction func sendAllParcelsButtonPressed(_ sender: UIBarButtonItem) {
        
        for oneParcel in allParcels {
            switch oneParcel.percelStatus {
            case .ReadyToDispatch :
                print("Parcel with ID: \(oneParcel.idParcel) has been shipped")
                fallthrough
            case .Shipped:
                print("Parcel with ID: \(oneParcel.idParcel) has been arrived to orogin post office")
                fallthrough
            case .ArrivedAtDesinationPostOffice:
                print("Parcel with ID: \(oneParcel.idParcel) has been successfully delivered")
                databaseRepositoty.updateDeliveryStatus(at: oneParcel.idParcel, on: ParcelStatus.SuccessfullyDelivered.rawValue)
                
                let alertController = UIAlertController(title: "Message", message: "Parcels have been successfully delivered", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
                case .Cancelled, .DeliveryFailed, .SuccessfullyDelivered:
                continue
            }
            
        }
    }
    
    @IBAction func refreshPulled(_ sender: UIRefreshControl) {
        allParcels = databaseRepositoty.getAllParcels() ?? []
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    
}


