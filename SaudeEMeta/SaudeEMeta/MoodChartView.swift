import SwiftUI
import Charts

struct MoodChartView: View {
    let dados: [MoodEntry]

    var body: some View {
        Chart(dados) {
            LineMark(
                x: .value("Data", $0.date),
                y: .value("Humor", valorParaHumor($0.mood))
            )
        }
        .frame(height: 200)
        .padding()
        .navigationTitle("Histórico de Humor")
    }

    private func valorParaHumor(_ humor: String) -> Int {
        switch humor {
        case "😀 Feliz": return 4
        case "😐 Neutro": return 3
        case "😢 Triste": return 2
        case "😡 Estressado": return 1
        default: return 0
        }
    }
}
