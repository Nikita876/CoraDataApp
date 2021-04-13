//
//  class CarDetails.swift
//  CoraDataApp
//
//  Created by Никита Коголенок on 23.02.21.
//

import Foundation

enum CarColor: String {
    case white
    case black
    case red
    case yellow
    case green
}

class CarDetails {
    var id: Int
    var name: String
    var model: String
    var color: CarColor
    
    init(id: Int, name: String, model: String, color: CarColor) {
        self.id = id
        self.name = name
        self.model = model
        self.color = color
    }
}
