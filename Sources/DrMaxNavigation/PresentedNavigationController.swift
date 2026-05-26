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

import Observation

@_spi(Testing)
@Observable
public final class PresentedNavigationController<Screen: Hashable>: RootNavigationController<Screen> {
    let allowsInteractiveDismiss: Bool

    override var completePath: [Screen] {
        [root].compactMap { $0 } + path + (presentation?.controller.completePath ?? [])
    }

    init(
        root: Screen,
        allowsInteractiveDismiss: Bool
    ) {
        self.allowsInteractiveDismiss = allowsInteractiveDismiss

        super.init(
            root: root,
            path: []
        )
    }
}
