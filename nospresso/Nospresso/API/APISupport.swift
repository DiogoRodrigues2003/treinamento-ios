//
//  APISupport.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import ImageIO

enum APIError: Error {
    case badUrl(string: String)
    case requestFailed(error: Error)
    case invalidData
    case decodeFailed(error: Error, textData: String?)
}

enum HTTPMethod: String {
    case post
    case `get`
    case delete
}
