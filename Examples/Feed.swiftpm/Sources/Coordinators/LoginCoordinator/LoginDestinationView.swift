import SwiftUI

struct LoginDestinationView: View {
    let destination: LoginDestination
    
    var body: some View {
        switch destination {
        case let .forgottenPassword(email): Text("Restore password for \(email)")
        case let .loginFailed(model): LoginFailedView(model: model)
        }
    }
}
