import CasePaths

@CasePathable
enum FeedCoordinatorDestination: Hashable, FeedDestinationProviding, LoginCoordinatorDestinationProviding {
    case feedCoordinator(FeedCoordinator<Self>)
    case feed(FeedDestination)
    case loginCoordinator(LoginCoordinator<Self>)
    case login(LoginDestination)
}

protocol LoginCoordinatorDestinationProviding: Hashable & CasePathable {
    static func loginCoordinator(_ : LoginCoordinator<Self>) -> Self
}
