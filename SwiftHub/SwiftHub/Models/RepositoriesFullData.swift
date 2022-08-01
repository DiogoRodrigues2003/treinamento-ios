//
//  RepositoriesFullData.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation

struct RepositoriesFullData: Decodable {
    
    let repositories: [Repository]

    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}
