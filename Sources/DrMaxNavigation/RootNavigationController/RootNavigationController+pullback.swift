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

public extension RootNavigationController {
    func pullback<Child: Hashable>(
        on child: CaseKeyPath<Screen, Child>
    ) -> NavigationController<Screen, Child> {
        NavigationController(
            parent: self,
            casePath: child
        )
    }
}
