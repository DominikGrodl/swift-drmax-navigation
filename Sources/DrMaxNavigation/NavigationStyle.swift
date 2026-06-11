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

/// Defines the visual style of a navigation transition.
public enum NavigationStyle: Sendable {
    /// Pushes a new screen onto the current navigation stack.
    case push

    /// Presents a new navigation tree as a sheet.
    /// - Parameter allowsInteractiveDismiss: Whether the user can dismiss the sheet with a swipe gesture.
    case sheet(allowsInteractiveDismiss: Bool)
    /// A sheet presentation that allows interactive dismissal.
    public static let sheet = NavigationStyle.sheet(allowsInteractiveDismiss: true)

    #if !os(watchOS)
    /// Presents a new navigation tree as a popover.
    /// - Parameter allowsInteractiveDismiss: Whether the user can dismiss the popover by tapping outside.
    case popover(allowsInteractiveDismiss: Bool)
    /// A popover presentation that allows interactive dismissal.
    public static let popover = NavigationStyle.popover(allowsInteractiveDismiss: true)
    #endif

    #if !os(macOS)
    /// Presents a new navigation tree as a full-screen cover.
    /// - Parameter allowsInteractiveDismiss: Whether the user can dismiss the cover with a swipe gesture (where supported).
    case cover(allowsInteractiveDismiss: Bool)
    /// A full-screen cover presentation that allows interactive dismissal.
    public static let cover = NavigationStyle.cover(allowsInteractiveDismiss: true)
    #endif
}
