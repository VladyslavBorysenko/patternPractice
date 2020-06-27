//
//  AddNewPackageViewController.swift
//  SwiftCRUD
//
//  Created by Владислав on 10.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class AddNewPackageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var databaseRepository = SQLiteDatabaseRepository()

    //MARK: - IBOutlets
    
    @IBOutlet weak var parcelTypeTextField: UITextField!
    
    @IBOutlet weak var parcelWeightTextField: UITextField!
    
    @IBOutlet weak var parcelCostTextField: UITextField!
    
    //MARK: - Variables

    var parcelTypePickerView = UIPickerView()
    var typeOfThisPackage: Int = 0
    
    //MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parcelTypeTextField.inputView = parcelTypePickerView
        parcelTypePickerView.delegate = self
        
    }
    
    //MARK: - Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ParcelType.allCases.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ParcelType(rawValue: row)?.description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        parcelTypeTextField.text = ParcelType(rawValue: row)?.description
        typeOfThisPackage = row
    }
    
    //MARK: - IBactions
    
    @IBAction func addNewPackageButtonPressed(_ sender: UIButton) {
        
        guard let weight = parcelWeightTextField.text else {return}
        guard let cost = parcelCostTextField.text else {return}
        
        let oneParcel = ParcelModel(idParcel: databaseRepository.getAParcelsNumber() ?? 1, typeOfParcel: typeOfThisPackage, weight: Int(weight)!, IdRecipient: Int.random(in: 1...databaseRepository.getRecipientsCount()), droneModel: Int.random(in: 1...databaseRepository.getDronesCount()), cost: Int(cost)!, parcelStatus: ParcelStatus.ReadyToDispatch.rawValue)
        
        databaseRepository.insertNewParcel(typeOfParcel: oneParcel!.typeOfParcel, weight: oneParcel!.weight, IdRecipient: oneParcel!.recipient, droneModel: oneParcel!.droneModel, cost: oneParcel!.cost, parcelStatus: oneParcel!.percelStatus.rawValue)
        
        let alert = UIAlertController(title: "Add new package", message: "Package successfull added", preferredStyle:.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func addNewParcelWithQrCodeButtonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("Image not found!")
            return
        }
        
        let qrCodeParcelDataArray = OpenCVWrapper.getQRCodeInformation(image).split(separator: ";")
        // In out QR codes 1-st parametr will be typeOfParcel, 2-d - weight, 3-d - cost
        print(OpenCVWrapper.getQRCodeInformation(image).split(separator: ";"))
        guard let weight = Int(qrCodeParcelDataArray[1]) else {return}
        guard let cost = Int(qrCodeParcelDataArray[2]) else {return}
        guard let typeOfThisPackage = Int(qrCodeParcelDataArray[0]), (ParcelType(rawValue: typeOfThisPackage) != nil) else {return}
        
        
        let oneParcel = ParcelModel(idParcel: databaseRepository.getAParcelsNumber() ?? 1, typeOfParcel: typeOfThisPackage, weight: weight, IdRecipient: Int.random(in: 1...databaseRepository.getRecipientsCount()), droneModel: Int.random(in: 1...databaseRepository.getDronesCount()), cost: cost, parcelStatus: ParcelStatus.ReadyToDispatch.rawValue)
         
        databaseRepository.insertNewParcel(typeOfParcel: oneParcel!.typeOfParcel, weight: oneParcel!.weight, IdRecipient: oneParcel!.recipient, droneModel: oneParcel!.droneModel, cost: oneParcel!.cost, parcelStatus: oneParcel!.percelStatus.rawValue)
        
        let alert = UIAlertController(title: "Successfully added", message: "Parcel with QR code has been added, plese update list of packages", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)

    }

}
