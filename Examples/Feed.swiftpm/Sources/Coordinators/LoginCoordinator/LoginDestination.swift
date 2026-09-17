import CasePaths

@CasePathable
enum LoginDestination: Hashable {
    case loginFailed(LoginFailedModel)
    case forgottenPassword(email: String)
}
