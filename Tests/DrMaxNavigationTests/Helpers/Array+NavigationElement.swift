@testable import DrMaxNavigation

extension Array where Element: Hashable {
    func asNavigationElements() -> [NavigationElement<Element>] {
        self.map { NavigationElement(wrapped: $0, wasNavigatedWithAnimation: true) }
    }
}
