import Foundation
import SQLite3

final class DatabaseManager {
    static let shared = DatabaseManager()
    private var db: OpaquePointer?

    private init() {
        abrirBanco()
        criarTabela()
    }

    private func abrirBanco() {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("humores.sqlite")

            if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                print("Erro ao abrir banco de dados")
            }
        } catch {
            print("Erro ao localizar diretório do banco: \(error)")
        }
    }

    private func criarTabela() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS humores (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            humor TEXT,
            data TEXT,
            nota TEXT
        );
        """

        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("Erro ao criar tabela: \(errorMsg)")
        }
    }

    func salvarHumor(_ humor: String, nota: String, dataSelecionada: Date) {
        let insertQuery = "INSERT INTO humores (humor, data, nota) VALUES (?, ?, ?);"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            let dateFormatter = ISO8601DateFormatter()
            let dataString = dateFormatter.string(from: dataSelecionada)

            sqlite3_bind_text(statement, 1, (humor as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (dataString as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (nota as NSString).utf8String, -1, nil)

            if sqlite3_step(statement) != SQLITE_DONE {
                let errorMsg = String(cString: sqlite3_errmsg(db))
                print("Erro ao inserir humor: \(errorMsg)")
            }
        } else {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("Erro ao preparar query de inserção: \(errorMsg)")
        }

        sqlite3_finalize(statement)
    }

    func listarHumores() -> [MoodEntry] {
        var resultados: [MoodEntry] = []

        let query = "SELECT humor, data, nota FROM humores ORDER BY id DESC;"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            let dateFormatter = ISO8601DateFormatter()

            while sqlite3_step(statement) == SQLITE_ROW {
                guard
                    let humorCStr = sqlite3_column_text(statement, 0),
                    let dataCStr = sqlite3_column_text(statement, 1)
                else {
                    continue
                }

                let humor = String(cString: humorCStr)
                let dataString = String(cString: dataCStr)
                let nota = sqlite3_column_text(statement, 2).flatMap { String(cString: $0) } ?? ""

                if let data = dateFormatter.date(from: dataString) {
                    let entry = MoodEntry(mood: humor, note: nota, date: data)
                    resultados.append(entry)
                }
            }
        } else {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("Erro ao preparar query de listagem: \(errorMsg)")
        }

        sqlite3_finalize(statement)
        return resultados
    }
}
