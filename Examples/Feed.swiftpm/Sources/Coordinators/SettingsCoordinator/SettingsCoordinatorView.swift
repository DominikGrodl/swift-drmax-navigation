import SwiftUI

struct SettingsCoordinatorView<Parent: Hashable>: View {
    let coordinator: SettingsCoordinator<Parent>
    
    var body: some View {
        SettingsView(model: coordinator.rootModel)
    }
}
