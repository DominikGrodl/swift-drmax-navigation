import CasePaths
import SwiftUI

struct LoginCoordinatorView<Parent: Hashable & CasePathable>: View {
    let coordinator: LoginCoordinator<Parent>
    
    var body: some View {
        LoginView(model: coordinator.rootModel)
    }
}
