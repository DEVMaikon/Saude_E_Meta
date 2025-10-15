//
//  AvaliacaoRiscoView.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25
//

import SwiftUI

struct AvaliacaoRiscoView: View {
    @State private var respostas: [Int] = Array(repeating: 0, count: 5)
    @State private var mostrarAlerta = false

    private let perguntas = [
        "Você tem se sentido estressado no ambiente de trabalho?",
        "Sente que consegue equilibrar vida pessoal e profissional?",
        "Tem se sentido ouvido(a) por colegas e líderes?",
        "Costuma conseguir concluir suas tarefas dentro do horário?",
        "Tem sentido sintomas como ansiedade, irritação ou cansaço excessivo?"
    ]

    private let opcoes = ["Nunca", "Às vezes", "Sempre"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(perguntas.indices, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(perguntas[index])
                                .font(.headline)

                            Picker("Selecione", selection: $respostas[index]) {
                                ForEach(opcoes.indices, id: \.self) { i in
                                    Text(opcoes[i])
                                        .tag(i)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }

                    Button(action: {
                        mostrarAlerta = true
                        // TODO: salvar respostas localmente se necessário (SQLite, UserDefaults etc)
                    }) {
                        Text("Enviar Avaliação")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 16)
                    .alert(isPresented: $mostrarAlerta) {
                        Alert(
                            title: Text("Avaliação enviada"),
                            message: Text("Obrigado por compartilhar! Continue cuidando da sua saúde mental."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Avaliação de Riscos")
        }
    }
}

