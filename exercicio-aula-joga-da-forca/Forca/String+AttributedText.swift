//
//  String+AttributedText.swift
//  Forca
//
//  Created by Locação on 20/07/22.
//

import Foundation
import UIKit

extension String {
    
    var espacado: NSMutableAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.kern: 12])
    }
    
    var comCorDeAcerto: NSMutableAttributedString {
        NSMutableAttributedString(string: self, attributes: [.foregroundColor: UIColor.green])
    }
    
    var comCorDeErro: NSMutableAttributedString {
        NSMutableAttributedString(string: self, attributes: [.foregroundColor: UIColor.red])
    }
}

extension NSMutableAttributedString {
    
    var espacado: NSMutableAttributedString {
        let mutableString = NSMutableAttributedString(attributedString: self)
        mutableString.addAttributes([.kern: 12], range: NSMakeRange(0, self.length))
        
        return mutableString
    }
}
