//
//  Endpoint.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation

enum Endpoint {
    case bag
    case coffees(id: Int?)
    case capsules
    case accessories
    case machines
    
    var url: String {
        switch self {
        case .coffees(let id):
            guard let id = id else { return "coffees"}
            return "coffees/\(id)"
        default:
            return "\(self)"
        }
    }
  
}
