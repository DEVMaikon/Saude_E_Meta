import XCTest
@testable import SaudeEMeta

final class SaudeEMetaTests: XCTestCase {

    override func setUpWithError() throws {
        // Código de setup antes de cada teste, se necessário.
    }

    override func tearDownWithError() throws {
        // Código de teardown após cada teste, se necessário.
    }

    func testExample() throws {
        // Exemplo de teste funcional.
    }

    func testPerformanceExample() throws {
        // Exemplo de teste de performance.
        self.measure {
            // Código a ser medido.
        }
    }

    func testSalvarEListarHumor() {
        let db = DatabaseManager.shared
        let antes = db.listarHumores().count

        db.salvarHumor("😀 Feliz", nota: "Testando", dataSelecionada: Date())
        let depois = db.listarHumores().count

        XCTAssertTrue(depois > antes, "Nova entrada de humor não foi salva.")
    }
}
