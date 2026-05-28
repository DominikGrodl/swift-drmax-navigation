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
            animated: animated,
            completion: completion
        )
        case let .root(controller): dismiss(
            from: controller,
            animated: animated,
            completion: completion
        )
        case nil: break
        }
    }

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
            animated: animated,
            completion: completion
        )
        case let .root(controller): dismiss(
            to: controller,
            animated: animated,
            completion: completion
        )
        case nil: break
        }
    }
}
