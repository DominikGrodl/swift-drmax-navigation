import SwiftUI

struct SettingsDestinationView: View {
    let destination: SettingsDestination
    
    var body: some View {
        switch destination {
        case .notifications: Text("Notifications")
        case .activity: Text("Recent activity")
        }
    }
}
