import SwiftUI

@main
struct MyApp: App {
    @State var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppView(coordinator: coordinator)
        }
    }
}
