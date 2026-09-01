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

extension RootNavigationController where Screen: CasePathable {
    /// Pops screens until a screen matching the specified case is at the top, then removes it too.
    /// - Parameters:
    ///   - element: A case key path to the destination screen case.
    ///   - animated: Whether to animate the transition. Defaults to `true`.
    ///   - completion: A closure to execute after the transition finishes.
    public func popBefore(
        _ element: PartialCaseKeyPath<Screen>,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        switch location(
            of: element,
            equals: { $0.is($1)
            }
        ) {
        case let .index(controller, index): remove(
            index: index,
            from: controller,
            completion: completion
        )
        case let .root(controller): dismiss(
            from: controller,
            completion: completion
        )
        case nil: break
        }
    }

    /// Pops screens until a screen matching the specified case is at the top.
    /// - Parameters:
    ///   - element: A case key path to the destination screen case.
    ///   - animated: Whether to animate the transition. Defaults to `true`.
    ///   - completion: A closure to execute after the transition finishes.
    public func popTo(
        _ element: PartialCaseKeyPath<Screen>,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        switch location(
            of: element,
            equals: { $0.is($1)
            }
        ) {
        case let .index(controller, index): removeAfter(
            index: index,
            from: controller,
            completion: completion
        )
        case let .root(controller): dismiss(
            to: controller,
            completion: completion
        )
        case nil: break
        }
    }
}
