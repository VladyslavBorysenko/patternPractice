//
//  ParcelModel.swift
//  SwiftCRUD
//
//  Created by Владислав on 09.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

enum ParcelStatus: Int, LosslessStringConvertible {
    
    var description: String{
        switch self {
        case .ArrivedAtDesinationPostOffice:
            return "Arrived at desination Postoffice"
        case .Cancelled:
            return "Cancelled"
        case .DeliveryFailed:
            return "Delivery failed"
        case .ReadyToDispatch:
            return "Ready to dispatch"
        case .Shipped:
            return "Shipped"
        case .SuccessfullyDelivered:
            return "Successfully delivered"

        }
    }
    
    case ReadyToDispatch = 1, Shipped, ArrivedAtDesinationPostOffice, SuccessfullyDelivered, Cancelled, DeliveryFailed
    
    init?(_ description: String) {
        self = .DeliveryFailed
    }
}

enum ParcelType: Int, CaseIterable, LosslessStringConvertible{
    init?(_ description: String) {
        self = .Package
    }
    
    var description: String {
        switch self {
            
        case .ClosedMail:
            return "Closed mail"
        case .MoneyTransfer:
            return "Money transfer"
        case .Package:
            return "Package"
        case .ParcelPost:
            return "Parcel post"
        case .PostCard:
            return "Post card"
        }
    }
    
    case ClosedMail = 1, PostCard, ParcelPost, Package, MoneyTransfer
}

struct ParcelModel: ParcelModelProtocol {
    var idParcel: Int
    var typeOfParcel: Int
    var weight: Int
    var recipient: Int
    var droneModel: Int
    var cost: Int
    var percelStatus: ParcelStatus

    init?(idParcel: Int, typeOfParcel: Int, weight: Int, IdRecipient: Int, droneModel: Int, cost: Int, parcelStatus: Int) {
        self.idParcel = idParcel
        self.typeOfParcel = typeOfParcel
        self.weight = weight
        self.recipient = IdRecipient
        self.droneModel = droneModel
        self.cost = cost
        self.percelStatus = ParcelStatus(rawValue: parcelStatus)!
    }
    
}
