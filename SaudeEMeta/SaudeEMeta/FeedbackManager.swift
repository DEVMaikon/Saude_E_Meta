import SwiftUI
import AVFoundation

class FeedbackManager {
    static func gerarFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    static func reproduzirSomConfirmacao() {
        AudioServicesPlaySystemSound(1104) // Som de clique
    }
}
