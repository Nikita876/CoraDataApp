//
//  ViewController.swift
//  CoraDataApp
//
//  Created by Никита Коголенок on 22.02.21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Actions
    @IBAction func writeToDB() {
        print("Write")
        
        CoreDataManager.shared.writeToDB(name: "Car")
    }
    @IBAction func readFromDB() {
        print("Read")
        
        CoreDataManager.shared.readFromDB(from: "Car")
    }
    @IBAction func removeFromDB() {
        print("Remove")
        
        CoreDataManager.shared.removeFromDB(from: "Car", with: 0)
    }
    @IBAction func removeAllFromDB() {
        print("Remove All")
        
        CoreDataManager.shared.removeAllFromDB(from: "Car")
    }
}

