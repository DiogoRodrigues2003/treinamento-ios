//
//  String+Character+Comparavel.swift
//  Forca
//
//  Created by Locação on 20/07/22.
//

import Foundation

extension Character {
    
    var comparavel: String {
        uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}

extension String {
    
    var comparavel: String {
        uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
