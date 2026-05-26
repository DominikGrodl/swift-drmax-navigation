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
                .navigationDestination(for: Screen.self) {
                    screen($0)
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
        if let root = controller.root {
            screen(root)
        }
    }
}

private extension View {
    func presentationModifiers(dismissable: Bool) -> some View {
        self
            .interactiveDismissDisabled(!dismissable)
            .presentationBackground(.background)
    }
}
