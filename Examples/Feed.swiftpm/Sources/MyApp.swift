import SwiftUI

@main
struct MyApp: App {
    @State var coordinator = AppCoordinator(
        bookmarksStore: BookmarksStore()
    )
    
    var body: some Scene {
        WindowGroup {
            AppView(coordinator: coordinator)
        }
    }
}
