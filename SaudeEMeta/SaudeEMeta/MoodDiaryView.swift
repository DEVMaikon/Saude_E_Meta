import SwiftUI
import AVFoundation

struct MoodDiaryView: View {
    @State private var selectedMood: String = ""
    @State private var note: String = ""
    @State private var savedEntries: [MoodEntry] = []
    @State private var showAlert = false
    @State private var showSuccess = false
    @State private var audioPlayer: AVAudioPlayer?

    let moods = ["😀 Feliz", "😐 Neutro", "😢 Triste", "😡 Estressado"]
    let feedbackGenerator = UINotificationFeedbackGenerator()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Como você está se sentindo hoje?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top)

                    // Lista de humores
                    VStack(spacing: 10) {
                        ForEach(moods, id: \.self) { mood in
                            Button(action: {
                                withAnimation(.spring()) {
                                    selectedMood = mood
                                }
                                feedbackGenerator.prepare()
                                feedbackGenerator.notificationOccurred(.success)
                            }) {
                                HStack {
                                    Text(mood)
                                        .padding()
                                        .accessibilityLabel("Humor: \(mood)")
                                    Spacer()
                                    if selectedMood == mood {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .transition(.scale)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }

                    // Campo de nota
                    TextField("Deseja escrever algo?", text: $note)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    // Botão de salvar
                    Button(action: salvarRegistro) {
                        Text("Salvar Registro")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedMood.isEmpty ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .disabled(selectedMood.isEmpty)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Aviso"),
                            message: Text("Por favor, selecione um humor."),
                            dismissButton: .default(Text("OK"))
                        )
                    }

                    // Animação de sucesso
                    if showSuccess {
                        Text("✅ Registro salvo!")
                            .font(.headline)
                            .foregroundColor(.green)
                            .transition(.opacity.combined(with: .scale))
                    }

                    Divider().padding(.top)

                    // Lista de registros
                    if savedEntries.isEmpty {
                        Text("Nenhum registro salvo ainda.")
                            .foregroundColor(.gray)
                            .padding(.top, 30)
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(savedEntries.reversed()) { entry in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(entry.mood)
                                        .font(.headline)
                                    if !entry.note.isEmpty {
                                        Text("Nota: \(entry.note)")
                                            .font(.subheadline)
                                    }
                                    Text("Data: \(entry.date.formatted(.dateTime.day().month().hour().minute()))")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.secondary.opacity(0.1))
                                .cornerRadius(10)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationTitle("Diário de Humor")
            .onAppear(perform: carregarRegistros)
        }
    }

    private func salvarRegistro() {
        guard !selectedMood.isEmpty else {
            showAlert = true
            return
        }

        DatabaseManager.shared.salvarHumor(selectedMood, nota: note, dataSelecionada: Date())
        carregarRegistros()
        selectedMood = ""
        note = ""

        withAnimation(.easeInOut(duration: 0.3)) {
            showSuccess = true
        }

        feedbackGenerator.notificationOccurred(.success)
        tocarSomDeConfirmacao()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                showSuccess = false
            }
        }
    }

    private func carregarRegistros() {
        savedEntries = DatabaseManager.shared.listarHumores()
    }

    private func tocarSomDeConfirmacao() {
        guard let soundURL = Bundle.main.url(forResource: "success", withExtension: "wav") else {
            print("⚠️ Arquivo de som não encontrado.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Erro ao reproduzir som: \(error.localizedDescription)")
        }
    }
}

