//
//  IDatabaseRepository.swift
//  SwiftCRUD
//
//  Created by Владислав on 05.01.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

protocol IDatabaseRepository: class {
    func getAllParcels() -> [ParcelModel]?
    func getAParcelsNumber() -> Int?
    func updateDeliveryStatus(at parcelId: Int, on status: Int) -> ()
    func getRecipientsCount() -> Int
    func getDronesCount() -> Int
    func insertNewParcel(typeOfParcel: Int, weight: Int, IdRecipient: Int, droneModel: Int, cost: Int, parcelStatus: Int) -> ()
}
