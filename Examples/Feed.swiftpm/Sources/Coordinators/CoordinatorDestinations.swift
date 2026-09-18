/*
 Both destination enums hold onto LoginCoordinator and its destinations. Navigating to the loginCoordinator
 case means it can manage its own navigation and push/present its destinations. This way you can share
 shared navigation logic between multiple unrelared parts of your app. Both Feed and Settings can navigate to Login, so they
 both navigate to LoginCoordinator and let it handle its navigation.
 
 Top level enums always have to hold onto both the coordinator case, as well as the appropriate destinations. You navigate to a coordinator by
 pushing/presenting the coordinator case (loginCoordinator/feedCoordinator in this case). That way the coordinator instance is retained and
 it can function. The instance is then released when you dismiss it, making the reference management automatic.
*/

import CasePaths

@CasePathable
enum FeedCoordinatorDestination: Hashable, FeedDestinationProviding, LoginCoordinatorDestinationProviding {
    case feedCoordinator(FeedCoordinator<Self>)
    case feed(FeedDestination)
    case loginCoordinator(LoginCoordinator<Self>)
    case login(LoginDestination)
}

@CasePathable
enum SettingsCoordinatorDestination: Hashable, LoginCoordinatorDestinationProviding {
    case settingsCoordinator(SettingsCoordinator<Self>)
    case settingsDestination(SettingsDestination)
    case loginCoordinator(LoginCoordinator<Self>)
    case loginDestination(LoginDestination)
}

protocol LoginCoordinatorDestinationProviding: Hashable & CasePathable {
    static func loginCoordinator(_ : LoginCoordinator<Self>) -> Self
}
