import Foundation

final class LoginFailedModel: HashableObject {
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    enum DelegateAction {
        case backToLogin
        case dismiss
    }
    
    func tryAgainButtonTapped() {
        delegate(.backToLogin)
    }
    
    func closeButtonTapped() {
        delegate(.dismiss)
    }
}
