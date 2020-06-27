//
//  SQLiteDatabaseRepository.swift
//  SwiftCRUD
//
//  Created by Владислав on 05.01.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteDatabaseRepository: IDatabaseRepository {
    
    func insertNewParcel(typeOfParcel: Int, weight: Int, IdRecipient: Int, droneModel: Int, cost: Int, parcelStatus: Int) {
        
        guard db.open() else {return}
        
        // 1 - it's devilery status, which will be assign for every new parcel
        _ = db.execute(sql: """
            INSERT into Parcel
            (parcel_type, Weight, Id_Recipient, Id_Drone, Cost, Status)
            VALUES(\(typeOfParcel),\(weight),\(IdRecipient),\(droneModel),\(cost), 1)
            """)
        print("Inserted")
        db.closeDB()
    }
    
    
    //MARK: - Properties
    let db = SQLiteDB.shared
    
    //MARK: - Functions
    
    func updateDeliveryStatus(at parcelId: Int, on status: Int) {
        guard db.open() else {return}
        
        _ = db.execute(sql: "update Parcel set Status = \(status) where Id_parcel = \(parcelId)")
        
        db.closeDB()
    }
    
    func getAllParcels() -> [ParcelModel]? {
        
        var parcel: [ParcelModel] = []
        
        guard db.open() else {return nil}
        
        let data = db.query(sql: """
            select Id_parcel, Parcel_type as "parcelType", Weight, Id_Recipient, Id_Drone as "droneModel", Cost, Status as "parcelStatus"
            FROM Parcel

            ORDER by Id_parcel
""")
        for parcelData in data{
            print(parcelData)
            print(data.count)
            let oneParcelData = ParcelModel(idParcel: parcelData["Id_parcel"] as! Int, typeOfParcel: parcelData["parcelType"] as! Int, weight: parcelData["Weight"] as! Int, IdRecipient: parcelData["Id_Recipient"] as! Int, droneModel: parcelData["droneModel"] as! Int , cost: parcelData["Cost"] as! Int, parcelStatus: parcelData["parcelStatus"] as! Int)!
            parcel.append(oneParcelData)
        }
        db.closeDB()
        return parcel
    }
    
    func getAParcelsNumber() -> Int? {
        guard db.open() else {return nil}
        let data = db.query(sql: "select count (*) from Parcel")
        let row = data[0]
        
        return row.values.first as! Int
    }
    
    func getRecipientsCount() -> Int {
        guard db.open() else {return 0}
        
        let data = db.query(sql: "select count (*) from Recipient")
        let countData = data[0]
        
        return countData.first?.value as! Int
        
        db.closeDB()
    }
    
    func getDronesCount() -> Int {
        guard db.open() else {return 0}
        
        let data = db.query(sql: "select count (*) from Drone")
        
        let countData = data[0]
        
        return countData.first?.value as! Int
        
        db.closeDB()
    }
}
