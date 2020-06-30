//
//  ParcelBuilder.swift
//  SwiftCRUD
//
//  Created by Владислав on 30.06.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

class ParcelBuilder: ParcelBuilderProtocol {
    
    
    //MARK: - Properties
    private var idParcel: Int?
    private var typeOfParcel: Int?
    private var weight: Int?
    private var recipient: Int?
    private var droneModel: Int?
    private var cost: Int?
    private var percelStatus: ParcelStatus?
    
    //MARK: - Functions
    func setIdParcel(id: Int) {
        self.idParcel = id
    }
    
    func setParcelType(type: Int) {
        self.typeOfParcel = type
    }
    
    func setParcelWeight(grams: Int) {
        self.weight = grams
    }
    
    func setRecipient(id: Int) {
        self.recipient = id
    }
    
    func setDroneModel(modelID: Int) {
        self.droneModel = modelID
    }
    
    func setParcelCost(value: Int) {
        self.cost = value
    }
    
    func setParcelStatuc(likeA value: ParcelStatus) {
        self.percelStatus = value
    }
    
    func createParcel() -> ParcelModelProtocol? {
        guard let idParcel = idParcel, let typeOfParcel = typeOfParcel, let weight = weight, let idRecipient = recipient, let droneModel = droneModel, let cost = cost, let parcelStatus = percelStatus else {return nil}
        return ParcelModel(idParcel: idParcel, typeOfParcel: typeOfParcel, weight: weight, IdRecipient: idRecipient, droneModel: droneModel, cost: cost, parcelStatus: parcelStatus.rawValue)
    }
    
    
}
