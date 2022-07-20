//
//  Funcoes.swift
//  Forca
//
//  Created by Locação on 20/07/22.
//

import Foundation

func troca(letra: String, na mascara: String, original: String) -> String {
    let character = Character(letra)
    var resultado = mascara
    
    for index in original.indices {
        if original[index] == character {
            resultado.remove(at: index)
            resultado.insert(character, at: index)
        }
    }
    
    return resultado
}
