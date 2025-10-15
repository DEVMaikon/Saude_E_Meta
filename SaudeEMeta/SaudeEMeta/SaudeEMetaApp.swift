//
//  SaudeEMetaApp.swift
//  SaudeEMeta
//
//  Created by maikon nunes on 20/05/25.
//

import SwiftUI

@main
struct SaudeEMetaApp: App {
    @State private var autenticado = false

    var body: some Scene {
        WindowGroup {
            if autenticado {
                ContentView()
            } else {
                Text("Autenticando...")
                    .onAppear {
                        AuthenticationManager.autenticarUsuario { sucesso in
                            autenticado = sucesso
                        }
                    }
            }
        }
    }
}
