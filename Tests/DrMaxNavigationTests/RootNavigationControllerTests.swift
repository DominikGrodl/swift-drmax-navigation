import CasePaths
@_spi(Testing) @testable import DrMaxNavigation
import Testing

@Suite("Plain Destination tests")
struct PlainDestinationTests {
    @Test
    func completePathShouldNotContainRootControllerRoot() {
        let controller = RootNavigationController<Destination>()
        controller.set(root: .one)
        controller.navigate(to: .two)

        #expect(controller.completePath == [.two])
    }

    @Test
    func completePathShouldReflectPresentedDestinations() {
        let controller = RootNavigationController<Destination>()

        controller.set(root: .one)
        controller.navigate(to: .two)
        controller.navigate(to: .three, style: .sheet)
        controller.navigate(to: .four)

        #expect(controller.completePath == [.two, .three, .four])
    }

    @Test
    func setRootShouldSetFirstRoot() {
        let controller = RootNavigationController<Destination>()
        #expect(controller.root == nil)
        controller.set(root: .two)
        #expect(controller.root == .two)
    }

    @Test
    func navigatingOnPresentingControllerPresentsOnTopMostController() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.one, .two]
        )

        controller.navigate(to: .one, style: .sheet)
        controller.navigate(to: .two, style: .sheet)

        controller.navigate(to: .four)
        controller.navigate(to: .three)

        #expect(controller.path == [.one, .two])
        #expect(controller.presentation != nil)
        #expect(controller.presentation!.controller.path.isEmpty)
        #expect(controller.presentation!.controller.presentation!.controller.path == [.four, .three])
    }

    @Test
    func popOnPresentingControllerPopsFromTopMostController() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.one, .two]
        )

        controller.navigate(to: .one, style: .sheet)
        controller.navigate(to: .two, style: .sheet)

        controller.navigate(to: .four)
        controller.navigate(to: .three)

        #expect(controller.path == [.one, .two])
        #expect(controller.presentation != nil)
        #expect(controller.presentation!.controller.path.isEmpty)
        #expect(controller.presentation!.controller.presentation!.controller.path == [.four, .three])

        controller.pop()

        #expect(controller.presentation!.controller.presentation!.controller.path == [.four])

        controller.pop()

        #expect(controller.presentation!.controller.presentation!.controller.path.isEmpty)
        #expect(controller.presentation!.controller.presentation != nil)

        controller.pop()

        #expect(controller.presentation!.controller.presentation == nil)
        #expect(controller.path == [.one, .two])
        #expect(controller.presentation != nil)
        #expect(controller.presentation!.controller.path.isEmpty)
    }

    @Test
    func presentingSheetPresentsSheet() {
        let controller = RootNavigationController<Destination>(root: .one)
        controller.navigate(to: .two, style: .sheet)

        let stateCorrect = switch controller.presentation {
        case .sheet: true
        default: false
        }

        #expect(stateCorrect)
    }
    
    #if !os(macOS)
    @Test
    func presentingCoverPresentsCover() {
        let controller = RootNavigationController<Destination>(root: .one)
        controller.navigate(to: .two, style: .cover)

        let stateCorrect = switch controller.presentation {
        case .cover: true
        default: false
        }

        #expect(stateCorrect)
    }
    #endif
    
    #if !os(watchOS)
    @Test
    func presentingPopoverPresentsPopover() {
        let controller = RootNavigationController<Destination>(root: .one)
        controller.navigate(to: .two, style: .popover)

        let stateCorrect = switch controller.presentation {
        case .popover: true
        default: false
        }

        #expect(stateCorrect)
    }
    #endif

    @Test
    func popRemovesLastElementFromFlatController() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.pop()

        #expect(controller.root == .one)
        #expect(controller.path == [.two])
    }

    @Test
    func popRemovesLastPresentedControllerWhenPresentedPathEmpty() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(
            to: .four,
            style: .sheet
        )

        #expect(controller.presentation != nil)

        controller.pop()

        #expect(controller.root == .one)
        #expect(controller.path == [.two, .three])
        #expect(controller.presentation == nil)
    }

    @Test
    func popToRootRemovesAll() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(to: .four, style: .sheet)

        controller.popToRoot()

        #expect(controller.path.isEmpty)
        #expect(controller.presentation == nil)
    }

    @Test
    func popBeforeRemovesIncludingElement() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popBefore(.three)

        #expect(controller.path == [.two])
    }

    @Test
    func popBeforeRemovesPresentationIfRoot() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(to: .four, style: .sheet)

        controller.popBefore(.four)

        #expect(controller.path == [.two, .three])
        #expect(controller.presentation == nil)
    }

    @Test
    func popBeforeFirstElementRemovescompletePath() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popBefore(.two)

        #expect(controller.path.isEmpty)
    }

    @Test
    func popToLastElementRemovesPresentationAndLastElement() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(to: .four, style: .sheet)

        #expect(controller.presentation != nil)

        controller.popBefore(.three)

        #expect(controller.path == [.two])
        #expect(controller.presentation == nil)
    }

    @Test
    func popToRemovesElementNotIncluding() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popTo(.three)

        #expect(controller.path == [.two, .three])
    }

    @Test
    func popToFirstElementRemovescompletePathAfter() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popTo(.two)

        #expect(controller.path == [.two])
    }

    @Test
    func popToLastElementRemovesPresentation() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(to: .four, style: .sheet)

        #expect(controller.presentation != nil)

        controller.popTo(.three)

        #expect(controller.path == [.two, .three])
        #expect(controller.presentation == nil)
    }

    @Test
    func popToPresentationRootShouldPopLastPresentationPath() {
        let controller = RootNavigationController<Destination>()
        controller.navigate(to: .one)
        controller.navigate(to: .two, style: .sheet)
        controller.navigate(to: .three)
        controller.navigate(to: .four)

        #expect(controller.path == [.one])
        #expect(controller.presentation?.controller.root == .two)
        #expect(controller.presentation?.controller.path == [.three, .four])

        controller.popToPresentationRoot()

        #expect(controller.path == [.one])
        #expect(controller.presentation?.controller.root == .two)
        #expect(controller.presentation!.controller.path.isEmpty)
    }
}

@Suite("CasePathable Destination conforming tests")
struct CasePathableDestinationTests {
    @Test
    func popBeforeRemovesIncludingElement() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popBefore(\.three)

        #expect(controller.path == [.two])
    }

    @Test
    func popBeforeFirstElementRemovescompletePath() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popBefore(\.two)

        #expect(controller.path.isEmpty)
    }

    @Test
    func popToLastElementRemovesPresentationAndLastElement() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(to: .four, style: .sheet)

        #expect(controller.presentation != nil)

        controller.popBefore(\.three)

        #expect(controller.path == [.two])
        #expect(controller.presentation == nil)
    }

    @Test
    func popToRemovesElementNotIncluding() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popTo(\.three)

        #expect(controller.path == [.two, .three])
    }

    @Test
    func popToFirstElementRemovescompletePathAfter() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three, .four]
        )

        controller.popTo(\.two)

        #expect(controller.path == [.two])
    }

    @Test
    func popToLastElementRemovesPresentation() {
        let controller = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        controller.navigate(to: .four, style: .sheet)

        #expect(controller.presentation != nil)

        controller.popTo(\.three)

        #expect(controller.path == [.two, .three])
        #expect(controller.presentation == nil)
    }
}
