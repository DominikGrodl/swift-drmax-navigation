import SwiftUI

struct SettingsView: View {
    let model: SettingsModel
    
    var body: some View {
        List {
            Section("Profile") {
                Button("Login") {
                    model.loginButtonTapped()
                }
            }
            
            Section("Bookmarks") {
                Button("Bookmarks") {
                    model.loginButtonTapped()
                }
            }
        }
        .navigationTitle("Settings")
    }
}
