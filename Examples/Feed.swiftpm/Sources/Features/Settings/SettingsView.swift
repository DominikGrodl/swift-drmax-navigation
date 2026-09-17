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
            
            Section("Notification") {
                Button("Notifications") {
                    model.notificationsButtonTapped()
                }
            }
            
            Section("Activity") {
                Button("Recent activity") {
                    model.activityButtonTapped()
                }
            }
        }
        .navigationTitle("Settings")
    }
}
