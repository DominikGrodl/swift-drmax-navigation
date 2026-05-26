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

import SwiftUI

public extension RootNavigationController {
    func navigate(
        to screen: Screen,
        style: NavigationStyle = .push,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        switch style {
        case .push: push(screen: screen, animated: animated, completion: completion)

        case let .sheet(dismissable): present(
            screen: screen,
            style: .sheet,
            dismissable: dismissable,
            animated: animated,
            completion: completion
        )

        #if !os(watchOS)
        case let .popover(dismissable): present(
            screen: screen,
            style: .popover,
            dismissable: dismissable,
            animated: animated,
            completion: completion
        )
        #endif

        #if !os(macOS)
        case let .cover(dismissable): present(
            screen: screen,
            style: .cover,
            dismissable: dismissable,
            animated: animated,
            completion: completion
        )
        #endif
        }
    }

    func popToRoot(
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        Transaction.conditionalyDisableAnimations(animated: animated) {
            path.removeAll()
            presentation = nil
        } completion: {
            completion()
        }
    }

    func pop(
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        if let presentation {
            if presentation.controller.path.isEmpty && presentation.controller.presentation == nil {
                self.presentation = nil
            } else {
                presentation.controller.pop(animated: animated, completion: completion)
            }
        } else {
            Transaction.conditionalyDisableAnimations(animated: animated) {
                guard !path.isEmpty else { return }
                path.removeLast()
            } completion: {
                completion()
            }
        }
    }

    func popBefore(
        _ element: Screen,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        switch location(
            of: element,
            equals: { $0 == $1 }
        ) {
        case let .index(controller, index): remove(
            index: index,
            from: controller,
            animated: animated,
            completion: completion
        )
        case let .root(parentController): dismiss(
            from: parentController,
            animated: animated,
            completion: completion
        )
        case nil: break
        }
    }

    func popTo(
        _ element: Screen,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        switch location(
            of: element,
            equals: { $0 == $1 }
        ) {
        case let .index(controller, index): removeAfter(
            index: index,
            from: controller,
            animated: animated,
            completion: completion
        )
        case let .root(parentController): dismiss(
            to: parentController,
            animated: animated,
            completion: completion
        )
        case nil: break
        }
    }

    func popToPresentationRoot(
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        Transaction.conditionalyDisableAnimations(animated: animated) {
            topMostController.path.removeAll()
        } completion: {
            completion()
        }
    }
}
