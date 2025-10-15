//
//  BemVindoView.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25.
//

import SwiftUI

struct BemVindoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Saúde é Meta")
                .font(.largeTitle)
                .bold()
            
            Text("Bem-vindo ao seu app de bem-estar!")
                .font(.title3)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
