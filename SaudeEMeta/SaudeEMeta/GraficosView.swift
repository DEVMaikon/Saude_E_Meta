//
//  GraficosView.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25
//

import SwiftUI
import Charts

struct HumorData: Identifiable {
    var id = UUID()
    var dia: String
    var nivel: Int
}

struct GraficosView: View {
    // Dados simulados — depois substituímos por dados reais persistidos
    let dadosHumor: [HumorData] = [
        HumorData(dia: "Seg", nivel: 1),
        HumorData(dia: "Ter", nivel: 2),
        HumorData(dia: "Qua", nivel: 0),
        HumorData(dia: "Qui", nivel: 2),
        HumorData(dia: "Sex", nivel: 1)
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Evolução do Humor (semana)")
                    .font(.headline)
                    .padding(.bottom)

                Chart {
                    ForEach(dadosHumor) { entrada in
                        BarMark(
                            x: .value("Dia", entrada.dia),
                            y: .value("Nível de Humor", entrada.nivel)
                        )
                        .foregroundStyle(by: .value("Nível", entrada.nivel))
                    }
                }
                .frame(height: 250)

                Text("Legenda:")
                    .font(.subheadline)
                    .padding(.top, 16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("0 - Triste")
                    Text("1 - Neutro")
                    Text("2 - Feliz")
                }
                .font(.caption)

                Spacer()
            }
            .padding()
            .navigationTitle("Gráficos Pessoais")
        }
    }
}

