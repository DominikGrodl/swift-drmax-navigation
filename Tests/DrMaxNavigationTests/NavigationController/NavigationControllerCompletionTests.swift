@_spi(Testing) @testable import DrMaxNavigation
import Testing

struct NavigationControllerCompletionTests {
    @Test
    func completionInvokedWhenPushing() async {
        let controller = controller()
        
        var completionCalled = false
        
        controller.navigate(to: .childOne, style: .push) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingBeforeExistingElement() async {
        let controller = controller()
        controller.navigate(to: .childOne)
        
        var completionCalled = false
        
        controller.popBefore(\.childOne) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingBeforeNonExistingElement() async {
        let controller = controller()
        controller.navigate(to: .childOne)
        
        var completionCalled = false
        
        controller.popBefore(\.childTwo) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToOnlyElement() async {
        let controller = controller()
        controller.navigate(to: .childOne)
        
        var completionCalled = false
        
        controller.popTo(\.childOne) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingBeforePresentedElement() async {
        let controller = controller()
        controller.navigate(to: .childOne, style: .sheet)
        
        var completionCalled = false
        
        controller.popBefore(\.childOne) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToPresentedElement() async {
        let controller = controller()
        controller.navigate(to: .childOne, style: .sheet)
        
        var completionCalled = false
        
        controller.popTo(\.childOne) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToFirstElement() async {
        let controller = controller()
        controller.navigate(to: .childOne)
        controller.navigate(to: .childTwo)
        
        var completionCalled = false
        
        controller.popTo(\.childOne) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToNonExistingElement() async {
        let controller = controller()
        controller.navigate(to: .childOne)
        
        var completionCalled = false
        
        controller.popTo(\.childTwo) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingEmptyPath() async {
        let controller = controller()
        var completionCalled = false
        
        controller.pop {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .childOne, style: .push)
        controller.navigate(to: .childTwo, style: .push)
        var completionCalled = false
        
        controller.pop {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToRootEmptyPath() async {
        let controller = controller()
        var completionCalled = false
        
        controller.popToRoot {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToRootNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .childOne, style: .push)
        controller.navigate(to: .childTwo, style: .push)
        var completionCalled = false
        
        controller.popToRoot {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToPresentationRootWithPresentation() async {
        let controller = controller()
        controller.navigate(to: .childOne, style: .sheet)
        var completionCalled = false
        
        controller.popToPresentationRoot {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPoppingToPresentationRootWithoutPresentation() async {
        let controller = controller()
        var completionCalled = false
        
        controller.popToPresentationRoot {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    @Test
    func completionInvokedWhenPresentingSheet() async {
        let controller = controller()
        var completionCalled = false
        
        controller.navigate(to: .childOne, style: .sheet) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    
    #if !os(macOS)
    @Test
    func completionInvokedWhenPresentingCover() async {
        let controller = controller()
        var completionCalled = false
        
        controller.navigate(to: .childOne, style: .cover) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    #endif
    
    #if !os(watchOS)
    @Test
    func completionInvokedWhenPresentingPopover() async {
        let controller = controller()
        var completionCalled = false
        
        controller.navigate(to: .childOne, style: .popover) {
            completionCalled = true
        }
        
        await wait(.seconds(1), for: completionCalled)
    }
    #endif
    
    private func controller() -> NavigationController<Destination, ChildDestination> {
        RootNavigationController().pullback(on: \.child)
    }
}
