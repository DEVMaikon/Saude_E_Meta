//
//  ContentView.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BemVindoView()
                .tabItem {
                    Label("Início", systemImage: "house.fill")
                }

            MoodDiaryView()
                .tabItem {
                    Label("Humor", systemImage: "face.smiling.fill")
                }

            AvaliacaoRiscoView()
                .tabItem {
                    Label("Avaliação", systemImage: "waveform.path.ecg.rectangle")
                }

            CanalEscutaView()
                .tabItem {
                    Label("Escuta", systemImage: "message.and.waveform.fill")
                }

            GraficosView()
                .tabItem {
                    Label("Gráficos", systemImage: "chart.bar.doc.horizontal")
                }

            LembretesView()
                .tabItem {
                    Label("Dicas", systemImage: "lightbulb.min.fill")
                }
        }
        .accentColor(.blue) // Cor dos ícones selecionados
    }
}

