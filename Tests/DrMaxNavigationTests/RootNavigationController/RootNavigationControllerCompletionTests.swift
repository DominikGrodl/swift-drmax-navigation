import CasePaths
@_spi(Testing) @_spi(Internal) @testable import DrMaxNavigation
import Testing

struct RootNavigationControllerCompletionTests {
    @Test
    func navigateWithPush() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.navigate(to: .one, style: .push) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func navigateWithSheet() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.navigate(to: .one, style: .sheet) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    #if !os(macOS)
    @Test
    func navigateWithCover() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.navigate(to: .one, style: .cover) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    #endif
    
    #if !os(watchOS)
    @Test
    func navigateWithPopover() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.navigate(to: .one, style: .popover) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    #endif
    
    @Test
    func popToRootOnEmptyPath() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.popToRoot {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToRootOnNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.popToRoot {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToRootOnNonEmptyPresentation() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        var completionInvoked = false
        
        controller.popToRoot {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToPresentationRootOnEmptyPath() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.popToPresentationRoot {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToPresentationRootOnNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.popToPresentationRoot {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToPresentationRootOnNonEmptyPresentation() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        var completionInvoked = false
        
        controller.popToPresentationRoot {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popOnEmptyPath() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.pop {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popOnNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.pop {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popOnNonEmptyPresentation() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        var completionInvoked = false
        
        controller.pop {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func completionInvokedWhenRemovingExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.removeFrom(index: 0, from: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func completionInvokedWhenRemovingNonExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.removeFrom(index: controller.path.endIndex, from: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func completionInvokedWhenRemovingAfterExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        var completionInvoked = false
        
        controller.removeAfter(index: 0, from: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func completionInvokedWhenRemovingAfterNonExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.removeAfter(index: controller.path.endIndex, from: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func dismissFromPresentingController() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        var completionInvoked = false
        
        controller.dismiss(from: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func dismissFromNotPresentingController() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.dismiss(from: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func dismissToPresentingController() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        var completionInvoked = false
        
        controller.dismiss(to: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func dismissToNotPresentingController() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.dismiss(to: controller) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popBeforeExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        var completionInvoked = false
        
        controller.popBefore(\.two) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popBeforeExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        var completionInvoked = false
        
        controller.popBefore(.two) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popBeforeNonExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.popBefore(.two) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popBeforeNonExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.popBefore(.two) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        var completionInvoked = false
        
        controller.popTo(\.one) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        var completionInvoked = false
        
        controller.popTo(.one) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToNonExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.popTo(.two) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func popToNonExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        var completionInvoked = false
        
        controller.popTo(.two) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func push() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.push(screen: .one, animated: true) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    @Test
    func sheet() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.present(
            screen: .one,
            style: .sheet,
            dismissable: true,
            animated: true,
        ) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    
    #if !os(macOS)
    @Test
    func cover() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.present(
            screen: .one,
            style: .cover,
            dismissable: true,
            animated: true,
        ) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    #endif
    
    #if !os(watchOS)
    @Test
    func popover() async {
        let controller = controller()
        
        var completionInvoked = false
        
        controller.present(
            screen: .one,
            style: .popover,
            dismissable: true,
            animated: true,
        ) {
            completionInvoked = true
        }
        
        await wait(.seconds(1), for: completionInvoked)
    }
    #endif
    
    private func controller() -> RootNavigationController<Destination> {
        RootNavigationController()
    }
}
