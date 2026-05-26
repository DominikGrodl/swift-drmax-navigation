@_spi(Testing) @testable import DrMaxNavigation
import Testing

struct PlainNavigationControllerDestinationTest {
    @Test
    func pushPropagatesToParent() async throws {
        let parent = RootNavigationController<Destination>(
            root: .one,
            path: [.two, .three]
        )

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne)

        #expect(parent.path == [.two, .three, .child(.childOne)])
    }

    @Test
    func presentationPropagatesToParent() async throws {
        let parent = RootNavigationController<Destination>()

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne, style: .cover)

        #expect(parent.presentation!.controller.root == .child(.childOne))
    }

    @Test
    func pushPropagatesToNestedParent() async throws {
        let parent = RootNavigationController<Destination>()

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne, style: .cover)

        #expect(parent.presentation!.controller.root == .child(.childOne))

        controller.navigate(to: .childTwo)

        #expect(parent.presentation!.controller.path == [.child(.childTwo)])
    }

    @Test
    func presentationPropagatesToNestedParent() async throws {
        let parent = RootNavigationController<Destination>()

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne, style: .cover)

        #expect(parent.presentation!.controller.root == .child(.childOne))

        controller.navigate(to: .childTwo, style: .cover)

        #expect(parent.presentation!.controller.presentation!.controller.root == .child(.childTwo))
    }

    @Test
    func popPropagatesToParentPath() async throws {
        let parent = RootNavigationController<Destination>(root: .one)

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne)
        controller.navigate(to: .childTwo)
        controller.pop()

        #expect(parent.path == [.child(.childOne)])
    }

    @Test
    func popPropagatesToParentPresentationWhenPresentedPathEmpty() async throws {
        let parent = RootNavigationController<Destination>(root: .one)

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne, style: .cover)

        #expect(parent.presentation != nil)

        controller.pop()

        #expect(parent.presentation == nil)
    }

    @Test
    func popPropagatesToParentPresentationWhenPresentedPathNotEmpty() async throws {
        let parent = RootNavigationController<Destination>(root: .one)

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne, style: .cover)
        controller.navigate(to: .childTwo)
        controller.navigate(to: .childThree)

        #expect(parent.presentation!.controller.path == [.child(.childTwo), .child(.childThree)])

        controller.pop()

        #expect(parent.presentation!.controller.path == [.child(.childTwo)])
    }

    @Test
    func popPropagatesToParentPresentationWhenPresentedPathSingleElement() async throws {
        let parent = RootNavigationController<Destination>(root: .one)

        let controller = parent.pullback(on: \.child)
        controller.navigate(to: .childOne, style: .cover)
        controller.navigate(to: .childTwo)

        #expect(parent.presentation!.controller.path == [.child(.childTwo)])

        controller.pop()

        #expect(parent.presentation!.controller.path.isEmpty)
    }

    @Test
    func popToRootPropagatesToParent() async throws {
        let parent = RootNavigationController<Destination>(root: .one)
        parent.navigate(to: .four)
        parent.navigate(to: .three)

        let controller = parent.pullback(on: \.child)

        controller.navigate(to: .childOne, style: .cover)
        controller.navigate(to: .childTwo)

        #expect(parent.path == [.four, .three])
        #expect(parent.presentation!.controller.path == [.child(.childTwo)])

        controller.popToRoot()

        #expect(parent.presentation == nil)
        #expect(parent.path.isEmpty)
    }

    @Test
    func popBeforePropagatesToParent() async throws {
        let parent = RootNavigationController<Destination>(root: .one)
        parent.navigate(to: .one)
        parent.navigate(to: .two)

        let controller = parent.pullback(on: \.child)

        controller.navigate(to: .childOne)
        parent.navigate(to: .three)

        #expect(parent.path == [.one, .two, .child(.childOne), .three])

        controller.popBefore(\.childOne)

        #expect(parent.path == [.one, .two])
    }

    @Test
    func popToPropagatesToParent() async throws {
        let parent = RootNavigationController<Destination>(root: .one)
        parent.navigate(to: .one)
        parent.navigate(to: .two)

        let controller = parent.pullback(on: \.child)

        controller.navigate(to: .childOne)
        parent.navigate(to: .three)

        #expect(parent.path == [.one, .two, .child(.childOne), .three])

        controller.popTo(\.childOne)

        #expect(parent.path == [.one, .two, .child(.childOne)])
    }

    @Test
    func popToPropagatesToNestedParent() async throws {
        let parent = RootNavigationController<Destination>(root: .one)
        parent.navigate(to: .one)
        parent.navigate(to: .two, style: .cover)

        let controller = parent.pullback(on: \.child)

        controller.navigate(to: .childOne)
        parent.navigate(to: .three)

        #expect(parent.presentation?.controller.path == [.child(.childOne), .three])

        controller.popTo(\.childOne)

        #expect(parent.presentation?.controller.path == [.child(.childOne)])
    }

    @Test
    func popBeforePropagatesToNestedParent() async throws {
        let parent = RootNavigationController<Destination>(root: .one)
        parent.navigate(to: .one)
        parent.navigate(to: .two, style: .cover)

        let controller = parent.pullback(on: \.child)

        controller.navigate(to: .childOne)
        parent.navigate(to: .three)

        #expect(parent.presentation?.controller.path == [.child(.childOne), .three])

        controller.popBefore(\.childOne)

        #expect(parent.presentation!.controller.path.isEmpty)
    }

    @Test
    func popBeforeDismissesPresentedRoot() async throws {
        let parent = RootNavigationController<Destination>(root: .one)

        let controller = parent.pullback(on: \.child)

        controller.navigate(to: .childOne, style: .cover)

        #expect(parent.presentation!.controller.root == .child(.childOne))
        controller.popBefore(\.childOne)
        #expect(parent.presentation == nil)
    }
}
