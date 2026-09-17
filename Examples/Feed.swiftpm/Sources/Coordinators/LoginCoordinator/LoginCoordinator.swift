import Foundation
import DrMaxNavigation
import CasePaths

@Observable
final class LoginCoordinator<ParentDestination: Hashable & CasePathable>: HashableObject {
    let controller: NavigationController<ParentDestination, LoginDestination>
    let rootModel: LoginModel
    
    var onDismiss: () -> Void = { reportUnimplemented() }
    
    init(
        controller: NavigationController<ParentDestination, LoginDestination>
    ) {
        self.controller = controller
        self.rootModel = LoginModel()
        
        rootModel.delegate = { [weak self] action in
            self?.handleLoginModelDelegate(action: action)
        }
    }
}

// MARK: - Delegate
private extension LoginCoordinator {
    func handleLoginModelDelegate(action: LoginModel.DelegateAction) {
        switch action {
        case .navigateToLoginFailed: navigateToLoginFailed()
        case let .navigateToForgottenPassword(email): navigateToForgottenPassword(email: email)
        }
    }
    
    func handleLoginFailedModelDelegate(action: LoginFailedModel.DelegateAction) {
        switch action {
        case .backToLogin:
            controller.popToPullbackRoot()
        case .dismiss:
            onDismiss()
        }
    }
}

// MARK: - Navigation
private extension LoginCoordinator {
    func navigateToLoginFailed() {
        let model = LoginFailedModel()
        
        model.delegate = { [weak self] action in
            self?.handleLoginFailedModelDelegate(action: action)
        }
        
        controller.navigate(to: .loginFailed(model))
    }
    
    func navigateToForgottenPassword(email: String) {
        controller.navigate(to: .forgottenPassword(email: email))
    }
}
