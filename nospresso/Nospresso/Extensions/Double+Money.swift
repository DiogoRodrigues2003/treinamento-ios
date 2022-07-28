//
//  Double+Money.swift
//  Nospresso
//
//  Created by Locação on 27/07/22.
//

import Foundation

extension Double {
    
    var asMoney: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt-BR")
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
