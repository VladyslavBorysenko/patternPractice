//
//  IParcelModel.swift
//  SwiftCRUD
//
//  Created by Владислав on 30.06.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

protocol ParcelModelProtocol{
    
    var idParcel: Int { get set }
    var typeOfParcel: Int { get set }
    var weight: Int { get set }
    var recipient: Int { get set }
    var droneModel: Int { get set }
    var cost: Int { get set }
    var percelStatus: ParcelStatus { get set }

}
