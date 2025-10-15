
//
//  CanalEscutaView.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 22/05/25.
//

import SwiftUI

struct CanalEscutaView: View {
    @State private var mensagem: String = ""
    @State private var mostrarAlerta: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Canal de Escuta")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Este espaço é anônimo e seguro. Compartilhe seus sentimentos, dúvidas ou desabafos. Estamos aqui para te ouvir.")
                    .font(.body)
                    .foregroundColor(.gray)

                TextEditor(text: $mensagem)
                    .frame(height: 200)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: {
                    if !mensagem.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        mostrarAlerta = true
                        mensagem = ""
                    }
                }) {
                    Text("Enviar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Canal de Escuta")
            .alert(isPresented: $mostrarAlerta) {
                Alert(title: Text("Mensagem enviada"),
                      message: Text("Obrigado por compartilhar. Estamos aqui para você."),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}
