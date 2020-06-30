//
//  Builder.swift
//  SwiftCRUD
//
//  Created by Владислав on 30.06.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

protocol ParcelBuilderProtocol {
    
    func setIdParcel(id: Int)
    func setParcelType(type: Int)
    func setParcelWeight(grams: Int)
    func setRecipient(id: Int)
    func setDroneModel(modelID: Int)
    func setParcelCost(value: Int)
    func setParcelStatuc(likeA value: ParcelStatus)
    func createParcel() -> ParcelModelProtocol?
}
