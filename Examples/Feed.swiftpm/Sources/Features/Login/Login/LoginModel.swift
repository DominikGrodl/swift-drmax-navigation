import Foundation

@Observable
final class LoginModel {
    var email = ""
    var password = ""
    
    enum DelegateAction {
        case navigateToLoginFailed
        case navigateToForgottenPassword(email: String)
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    func loginButtonTapped() {
        delegate(.navigateToLoginFailed)
    }
    
    func forgottenPasswordButtonTapped() {
        delegate(.navigateToForgottenPassword(email: email))
    }
}
