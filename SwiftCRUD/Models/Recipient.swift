//
//  Recipient.swift
//  SwiftCRUD
//
//  Created by Владислав on 09.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

struct Recipient {
    var IdRecipient: Int
    var firstName: String
    var lastName: String
    var age: Int
    var phoneNumber: String
    var address: String
    
    init(id: Int, firstName: String, lastName: String, age: Int, phoneNumber: String, address: String) {
        self.IdRecipient = id
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.phoneNumber = phoneNumber
        self.address = address
    }
}
