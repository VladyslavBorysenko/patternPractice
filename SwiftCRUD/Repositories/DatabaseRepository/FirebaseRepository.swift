//
//  FirebaseRepository.swift
//  SwiftCRUD
//
//  Created by Vlad Borisenko on 11.07.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation
import Firebase

class FirebaseRepository: IDatabaseRepository {
    // MARK: Properties
    let firebase = Firestore.firestore()
    // MARK: Functinons
    func getAllParcels() -> [ParcelModel]? {
        var parcels: [ParcelModel] = []
        let data = firebase.collection("Parcels").order(by: "parcelId", descending: true)
        data.getDocuments { (querySnap, error) in
            guard let response = querySnap else {return}
            for item in response.documents{
                let oneProduct = ParcelModel(data: item.data())
                parcels.append(oneProduct)
            }
        }
        return parcels
    }
    
    func getAParcelsNumber() -> Int? {
        var documentsCount: Int?
        let data = firebase.collection("Parcels")
        data.getDocuments { (querySnap, error) in
            guard let count = querySnap?.documents.count else {return}
            documentsCount = count
        }
        return documentsCount
    }
    
    func updateDeliveryStatus(at parcelId: Int, on status: Int) {
        firebase.collection("Parcels").document(String(parcelId)).updateData([
            "parcelStatus": status,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    func getRecipientsCount() -> Int {
        var recipientsCount: Int = 0
        let data = firebase.collection("Recipients")
        data.getDocuments { (querySnap, error) in
            guard let count = querySnap?.documents.count else {return}
            recipientsCount = count
        }
        return recipientsCount
    }
    
    func getDronesCount() -> Int {
        var recipientsCount: Int = 0
        let data = firebase.collection("Drones")
        data.getDocuments { (querySnap, error) in
            guard let count = querySnap?.documents.count else {return}
            recipientsCount = count
        }
        return recipientsCount
    }
    
    func insertNewParcel(typeOfParcel: Int, weight: Int, IdRecipient: Int, droneModel: Int, cost: Int, parcelStatus: Int) {
        var ref: DocumentReference? = nil
        ref = firebase.collection("Parcels").addDocument(data: [
            "parcelId": UUID().uuidString,
            "parcelType": typeOfParcel,
            "weight": weight,
            "recipient": IdRecipient,
            "drone": droneModel,
            "cost": cost,
            "parcelStatus": parcelStatus
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
}
