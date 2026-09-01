// ===----------------------------------------------------------------------===//
//
// This source file is part of the DrMaxNavigation open source project
//
// Copyright (c) 2026 Dr. Max BDC, s.r.o. and the DrMaxNavigation project authors
// Licensed under The MIT License (MIT)
//
// See LICENSE.md for license information
// See CONTRIBUTORS.md for the list of DrMaxNavigation project authors
//
// ===----------------------------------------------------------------------===//

import CasePaths
import SwiftUI

/// The main controller for managing a navigation tree.
///
/// ``RootNavigationController`` is the source of truth for your navigation state. It manages:
/// - The root screen of the navigation tree.
/// - The current stack (path) of pushed screens.
/// - Any active presentation (sheet, cover, popover), which can in turn have its own navigation tree.
///
/// You typically create one ``RootNavigationController`` per major section of your app (e.g., per tab).
///
/// ```swift
/// let dashboardController = RootNavigationController<DashboardScreen>(root: .home)
/// ```
@Observable
public class RootNavigationController<Screen: Hashable>: Identifiable {
    public private(set) var root: NavigationElement<Screen>?
    public var path: [NavigationElement<Screen>]
    public internal(set) var presentation: Presentation<Screen>?

    init(
        root: Screen? = nil,
        path: [Screen] = [],
        rootSetWithAnimation: Bool
    ) {
        if let root {
            self.root = NavigationElement(wrapped: root, wasNavigatedWithAnimation: rootSetWithAnimation)
        }
        
        self.path = path.map { NavigationElement(wrapped: $0, wasNavigatedWithAnimation: true) }
    }

    var completePath: [NavigationElement<Screen>] {
        path + (presentation?.controller.completePath ?? [])
    }

    var topMostController: RootNavigationController<Screen> {
        if let presentation {
            return presentation.controller.topMostController
        }

        return self
    }

    /// Sets the root screen of the controller.
    /// - Parameter screen: The screen to set as root.
    /// - Note: This can only be called once, typically if the controller was initialized without a root.
    public func set(root screen: Screen) {
        precondition(self.root == nil)
        self.root = NavigationElement(wrapped: screen, wasNavigatedWithAnimation: false)
    }
}

// MARK: - Private Methods
@_spi(Internal)
public extension RootNavigationController {
    func remove(
        index: Array<Screen>.Index,
        from controller: RootNavigationController,
        completion: @escaping () -> Void
    ) {
        guard controller.path.indices.contains(index) else {
            return
        }
        
        let animated = controller.path[index].wasNavigatedWithAnimation
        
        Transaction.conditionalyDisableAnimations(animated: animated) {
            controller.presentation = nil
            controller.path.removeSubrange(index...)
        } completion: {
            completion()
        }
    }

    func removeAfter(
        index: Array<Screen>.Index,
        from controller: RootNavigationController,
        completion: @escaping () -> Void
    ) {
        let poppedElementIndex = controller.path.index(after: index)
        
        let animated: Bool
        
        if index == controller.path.indices.last {
            animated = controller.presentation?.controller.root?.wasNavigatedWithAnimation ?? false
        } else {
            animated = controller.path[poppedElementIndex].wasNavigatedWithAnimation
        }
        
        Transaction.conditionalyDisableAnimations(animated: animated) {
            controller.presentation = nil
            controller.path.removeSubrange(poppedElementIndex...)
        } completion: {
            completion()
        }
    }

    func dismiss(
        from controller: RootNavigationController,
        completion: @escaping () -> Void
    ) {
        guard let presentation = controller.presentation else { return }
        let animated = presentation.controller.root?.wasNavigatedWithAnimation ?? true
        
        Transaction.conditionalyDisableAnimations(animated: animated) {
            controller.presentation = nil
        } completion: {
            completion()
        }
    }

    func dismiss(
        to controller: RootNavigationController,
        completion: @escaping () -> Void
    ) {
        guard let presentation = controller.presentation else {
            return
        }
        
        let animated = presentation.controller.root?.wasNavigatedWithAnimation ?? true
        
        Transaction.conditionalyDisableAnimations(animated: animated) {
            controller.presentation = nil
            controller.path.removeAll()
        } completion: {
            completion()
        }
    }

    func push(
        screen: Screen,
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        Transaction.conditionalyDisableAnimations(animated: animated) {
            topMostController.path.append(NavigationElement(wrapped: screen, wasNavigatedWithAnimation: animated))
        } completion: {
            completion()
        }
    }

    func present(
        screen: Screen,
        style: PresentationStyle,
        dismissable: Bool,
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        if let presentation {
            presentation.controller.present(
                screen: screen,
                style: style,
                dismissable: dismissable,
                animated: animated,
                completion: completion
            )
        } else {
            let controller = PresentedNavigationController(
                root: screen,
                animated: animated,
                allowsInteractiveDismiss: dismissable
            )

            Transaction.conditionalyDisableAnimations(animated: animated) {
                switch style {
                case .sheet: self.presentation = .sheet(controller)

                #if !os(watchOS)
                case .popover: self.presentation = .popover(controller)
                #endif

                #if !os(macOS)
                case .cover: self.presentation = .cover(controller)
                #endif
                }
            } completion: {
                completion()
            }
        }
    }

    @_spi(Internal)
    func location<Element>(
        of element: Element,
        equals: (Screen, Element) -> Bool
    ) -> ElementLocationResult? {
        if let index = path.firstIndex(where: { equals($0.wrapped, element) }) {
            return .index(controller: self, index: index)
        }

        if let presentation, let root = presentation.controller.root, equals(root.wrapped, element) {
            return .root(parentController: self)
        }

        return presentation?.controller.location(of: element, equals: equals)
    }
}

public extension RootNavigationController {
    /// Creates a new navigation controller.
    /// - Parameters:
    ///   - root: The initial screen to display.
    ///   - path: The initial stack of pushed screens.
    convenience init(
        root: Screen? = nil,
        path: [Screen] = []
    ) {
        self.init(root: root, path: path, rootSetWithAnimation: true)
    }
}

public struct NavigationElement<Wrapped: Hashable>: Hashable {
    let wrapped: Wrapped
    let wasNavigatedWithAnimation: Bool
}
