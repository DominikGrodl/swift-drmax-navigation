extension RootNavigationController where Screen: CaseEquatable {
    public func navigate(
        to screen: Screen,
        style: NavigationStyle = .push,
        animated: Bool = true,
        allowsSameScreenNesting: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        if !allowsSameScreenNesting, let first = completePath.first { $0.wrapped.equals(screen) } {
            popBefore(first.wrapped)
        }
        
        navigate(
            to: screen,
            style: style,
            animated: animated,
            completion: completion
        )
    }
}
