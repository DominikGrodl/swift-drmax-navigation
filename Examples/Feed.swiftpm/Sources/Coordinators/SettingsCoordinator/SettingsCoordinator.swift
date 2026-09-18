import DrMaxNavigation
import Foundation

@Observable
final class SettingsCoordinator<Parent: Hashable>: HashableObject {
    let controller: NavigationController<Parent, SettingsDestination>
    let rootModel: SettingsModel
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    enum DelegateAction {
        case navigateToLogin
    }
    
    init(controller: NavigationController<Parent, SettingsDestination>) {
        self.controller = controller
        
        let settingsModel = SettingsModel()
        
        rootModel = settingsModel
        
        rootModel.delegate = { [weak self] action in
            self?.handleSettingsModelDelegate(action: action)
        }
    }
}

// MARK: - Delegate
private extension SettingsCoordinator {
    func handleSettingsModelDelegate(action: SettingsModel.DelegateAction) {
        switch action {
        case .navigateToLogin:
            delegate(.navigateToLogin)
        case .navigateToNotifications:
            navigateToNotifications()
        case .navigateToActivity:
            navigateToActivity()
        }
    }
}

// MARK: - Navigation
private extension SettingsCoordinator {
    func navigateToNotifications() {
        controller.navigate(to: .notifications, style: .sheet)
    }
    
    func navigateToActivity() {
        controller.navigate(to: .activity, style: .sheet)
    }
}
