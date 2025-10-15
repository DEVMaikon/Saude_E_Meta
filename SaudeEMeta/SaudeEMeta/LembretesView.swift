//
//  LembretesView.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25
//

import SwiftUI

struct Dica: Identifiable {
    let id = UUID()
    let titulo: String
    let descricao: String
}

struct LembretesView: View {
    let dicas: [Dica] = [
        Dica(titulo: "Pausa para respiração", descricao: "Reserve 5 minutos do seu dia para respirar profundamente e relaxar."),
        Dica(titulo: "Conexão social", descricao: "Converse com um colega ou amigo. Compartilhar ajuda a aliviar o estresse."),
        Dica(titulo: "Organize sua agenda", descricao: "Planejar o dia pode reduzir a ansiedade e aumentar o foco."),
        Dica(titulo: "Movimente-se", descricao: "Caminhe, alongue-se ou faça algum exercício leve por 15 minutos."),
        Dica(titulo: "Durma bem", descricao: "Tente manter um padrão de sono regular e reparador.")
    ]

    var body: some View {
        NavigationView {
            List(dicas) { dica in
                VStack(alignment: .leading, spacing: 8) {
                    Text(dica.titulo)
                        .font(.headline)
                    Text(dica.descricao)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Dicas e Apoio")
        }
    }
}


