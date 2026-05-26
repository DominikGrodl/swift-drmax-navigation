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

public enum NavigationStyle: Sendable {
    case push

    case sheet(allowsInteractiveDismiss: Bool)
    public static let sheet = NavigationStyle.sheet(allowsInteractiveDismiss: true)

    #if !os(watchOS)
    case popover(allowsInteractiveDismiss: Bool)
    public static let popover = NavigationStyle.popover(allowsInteractiveDismiss: true)
    #endif

    #if !os(macOS)
    case cover(allowsInteractiveDismiss: Bool)
    public static let cover = NavigationStyle.cover(allowsInteractiveDismiss: true)
    #endif
}
