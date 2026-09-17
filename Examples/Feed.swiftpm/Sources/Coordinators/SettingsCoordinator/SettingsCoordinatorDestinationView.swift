import SwiftUI

struct SettingsCoordinatorDestinationView: View {
    let destination: SettingsCoordinatorDestination
    
    var body: some View {
        switch destination {
        case .notifications: Text("Notifications")
        case .activity: Text("Recent activity")
        }
    }
}
