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

@_spi(Internal)
public extension RootNavigationController {
    enum PresentationStyle {
        case sheet

        #if !os(watchOS)
        case popover
        #endif

        #if !os(macOS)
        case cover
        #endif
    }

    enum ElementLocationResult {
        case index(controller: RootNavigationController, index: Array<Screen>.Index)
        case root(parentController: RootNavigationController)
    }
}
