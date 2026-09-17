import CasePaths

@CasePathable
enum SettingsDestination: Hashable, LoginCoordinatorDestinationProviding {
    case settingsCoordinator(SettingsCoordinator<Self>)
    case settingsDestination(SettingsCoordinatorDestination)
    case loginCoordinator(LoginCoordinator<SettingsDestination>)
    case loginDestination(LoginDestination)
}
