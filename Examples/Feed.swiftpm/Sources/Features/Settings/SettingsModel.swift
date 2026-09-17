import Observation

@Observable
final class SettingsModel: HashableObject {
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    enum DelegateAction {
        case navigateToLogin
        case navigateToNotifications
        case navigateToActivity
    }
    
    func loginButtonTapped() {
        delegate(.navigateToLogin)
    }
    
    func notificationsButtonTapped() {
        delegate(.navigateToNotifications)
    }
    
    func activityButtonTapped() {
        delegate(.navigateToActivity)
    }
}
