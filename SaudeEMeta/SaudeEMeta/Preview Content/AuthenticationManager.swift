import LocalAuthentication

class AuthenticationManager {
    static func autenticarUsuario(completion: @escaping (Bool) -> Void) {
        let contexto = LAContext()
        var erro: NSError?

        if contexto.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &erro) {
            let razao = "Por favor, autentique-se para acessar o app."

            contexto.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: razao) { sucesso, erro in
                DispatchQueue.main.async {
                    completion(sucesso)
                }
            }
        } else {
            completion(true) // Caso não tenha biometria configurada
        }
    }
}

