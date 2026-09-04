import CasePaths
import SwiftUI

struct FeedCoordinatorView<ParentDestination: Hashable & CasePathable>: View {
    let coordinator: FeedCoordinator<ParentDestination>
    
    var body: some View {
        FeedView(model: coordinator.feedModel)
    }
}
