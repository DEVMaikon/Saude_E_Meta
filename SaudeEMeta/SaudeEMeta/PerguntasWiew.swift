//
//  PerguntasWiew.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 21/05/25.
//

import Foundation

struct Pergunta: Identifiable {
    let id = UUID()
    let texto: String
    let opcoes: [String]
    var respostaSelecionada: Int? = nil
}

