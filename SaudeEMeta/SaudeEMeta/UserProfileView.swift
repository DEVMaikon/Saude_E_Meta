import SwiftUI

struct UserProfileView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("avatar") private var avatar: String = "👤"
    let avatars = ["👨‍💻", "👩‍🏫", "🧑‍🚀", "🧑‍🎨", "👨‍⚕️", "👩‍🔬"]

    var body: some View {
        Form {
            Section(header: Text("Nome")) {
                TextField("Seu nome", text: $userName)
            }

            Section(header: Text("Escolha um avatar")) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(avatars, id: \.self) { icon in
                            Text(icon)
                                .font(.largeTitle)
                                .padding()
                                .background(avatar == icon ? Color.blue.opacity(0.3) : Color.clear)
                                .cornerRadius(8)
                                .onTapGesture {
                                    avatar = icon
                                }
                        }
                    }
                }
            }
        }
        .navigationTitle("Perfil")
    }
}
