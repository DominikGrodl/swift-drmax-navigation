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

/// A navigation controller scoped to a subset of a parent screen enum.
///
/// Use this when a feature/section owns only a slice of the parent `Screen` enum.
/// It embeds `Child` values into `Parent` via a `CaseKeyPath` before
/// forwarding every navigation call to the underlying `RootNavigationController`.
///
/// ```swift
/// @CasePathable
/// enum AppScreen: Hashable {
///     case dashboard(DashboardScreen)
///     case catalog(CatalogScreen)
/// }
///
/// // Child controller scoped to DashboardScreen only
/// let child = NavigationController(
///     parent: appNavigationController,
///     casePath: \.dashboard
/// )
/// child.navigate(to: .detail(id: "42"))    // pushes AppScreen.dashboard(.detail(id: "42"))
/// ```
public struct NavigationController<Parent: Hashable, Child: Hashable> {
    @_spi(Internal)
    public let parent: RootNavigationController<Parent>

    private let casePath: CaseKeyPath<Parent, Child>

    init(
        parent: RootNavigationController<Parent>,
        casePath: CaseKeyPath<Parent, Child>
    ) {
        self.parent = parent
        self.casePath = casePath
    }
}

// MARK: - Public API
public extension NavigationController {
    func navigate(
        to screen: Child,
        style: NavigationStyle = .push,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        parent.navigate(to: casePath(screen), style: style, animated: animated, completion: completion)
    }

    func pop(
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        parent.pop(animated: animated, completion: completion)
    }

    func popToRoot(
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        parent.popToRoot(animated: animated, completion: completion)
    }

    func popToPresentationRoot(
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        parent.popToPresentationRoot(
            animated: animated,
            completion: completion
        )
    }
}

// MARK: - Public CasePathable API
public extension NavigationController where Child: CasePathable, Parent: CasePathable {
    func popToPullbackRoot(animated: Bool = true) {
        if let screen = parent.completePath.compactMap({ $0[case: casePath] }).first {
            parent.popBefore(casePath(screen), animated: animated)
        }
    }
    
    func popBefore(
        _ element: PartialCaseKeyPath<Child>,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        if let screen = find(element) {
            parent.popBefore(
                casePath(screen),
                animated: animated,
                completion: completion
            )
        }
    }

    func popTo(
        _ element: PartialCaseKeyPath<Child>,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        if let screen = find(element) {
            parent.popTo(
                casePath(screen),
                animated: animated,
                completion: completion
            )
        }
    }
}

// MARK: - Private CasePathable Methods
private extension NavigationController where Child: CasePathable, Parent: CasePathable {
    func find(
        _ element: PartialCaseKeyPath<Child>
    ) -> Child? {
        parent
            .completePath
            .compactMap { $0[case: casePath] }
            .first { $0.is(element) }
    }
}
