//
//  JogoDaForca.swift
//  Forca
//
//  Created by Locação on 19/07/22.
//

import Foundation

let palavras = ["abelha": "inseto",
                "formiga": "inseto",
                "macaco": "animal",
                "cabra": "animal"]

enum EstadoJogo {
    case emAndamento
    case derrota
    case vitoria
}

class JogoDaForca {
    let palavra: String
    let dica: String
    
    private(set) var palavraMascarada: String
    private(set) var tentativasAnteriores: [String] = []
    private(set) var erros: Int = 0
    private(set) var estadoJogo: EstadoJogo
    
    init(palavra: String, dica: String) {
        self.palavra = palavra.uppercased()
        self.dica = dica
        
        self.palavraMascarada = palavra.map {_ in "_" }.joined()
        
        estadoJogo = EstadoJogo.emAndamento
    }
    
    func tentar(letra: String) {
        guard let letraComparavel = letra.first?.comparavel else {
            return
        }
        
        guard !tentativasAnteriores.contains(letraComparavel) else {
            return
        }
        
        tentativasAnteriores.append(letraComparavel)
        
        guard palavra.contains(letraComparavel) else {
            erros += 1
            
            if erros > 5 {
                estadoJogo = EstadoJogo.derrota
            }
            
            return
        }
        
        palavraMascarada = troca(letra: letraComparavel, na: palavraMascarada, original: palavra)
        
        if palavraMascarada.comparavel == palavra {
            estadoJogo = EstadoJogo.vitoria
        }
    }
}


extension JogoDaForca {
    class func aleatorio() -> JogoDaForca {
        guard let item = palavras.randomElement() else {
            return .init(palavra: "abelha", dica: "inseto")
        }
        
        return .init(palavra: item.key, dica: item.value)
    }
}


