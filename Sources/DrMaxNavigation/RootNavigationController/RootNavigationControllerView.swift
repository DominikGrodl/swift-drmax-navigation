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

/// A SwiftUI view that renders a ``RootNavigationController``.
///
/// This view handles the rendering of the root screen, the navigation stack, and any active presentations.
/// It recursively renders itself for any presented navigation controllers.
///
/// ```swift
/// RootNavigationControllerView(controller: myCoordinator.controller) { screen in
///     switch screen {
///     case .home: HomeView()
///     case .detail: DetailView()
///     }
/// }
/// ```
public struct RootNavigationControllerView<
    Screen: Hashable,
    ScreenView: View
>: View {
    @Bindable var controller: RootNavigationController<Screen>
    let screen: (Screen) -> ScreenView

    public init(
        controller: RootNavigationController<Screen>,
        @ViewBuilder screen: @escaping (Screen) -> ScreenView
    ) {
        self.controller = controller
        self.screen = screen
    }

    public var body: some View {
        NavigationStack(path: $controller.path) {
            root
                .navigationDestination(for: NavigationElement<Screen>.self) {
                    screen($0.wrapped)
                }
        }
        .sheet(item: $controller.sheet) { controller in
            RootNavigationControllerView(
                controller: controller,
                screen: screen
            )
            .presentationModifiers(dismissable: controller.allowsInteractiveDismiss)
        }
        #if !os(watchOS)
        .popover(item: $controller.popover) { controller in
            RootNavigationControllerView(
                controller: controller,
                screen: screen
            )
            .presentationModifiers(dismissable: controller.allowsInteractiveDismiss)
        }
        #endif
        #if !os(macOS)
        .fullScreenCover(item: $controller.cover) { controller in
            RootNavigationControllerView(
                controller: controller,
                screen: screen
            )
            .presentationModifiers(dismissable: controller.allowsInteractiveDismiss)
        }
        #endif
    }

    @ViewBuilder
    private var root: some View {
        if let root = controller.root?.wrapped {
            screen(root)
        }
    }
}

private extension View {
    func presentationModifiers(dismissable: Bool) -> some View {
        self
            .interactiveDismissDisabled(!dismissable)
            .conditionalPresentationBackground()
    }
    
    @ViewBuilder
    func conditionalPresentationBackground() -> some View {
        if #available(iOS 18.0, *) {
            self.presentationBackground(.background)
        } else {
            self
        }
    }
}
