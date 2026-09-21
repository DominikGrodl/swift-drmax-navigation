import CasePaths
@_spi(Testing) @_spi(Internal) @testable import DrMaxNavigation
import Testing

struct RootNavigationControllerCompletionTests {
    @Test
    func invokedWhenNavigatingWithPush() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.navigate(to: .one, style: .push) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenNavigatingWithSheet() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.navigate(to: .one, style: .sheet) {
                confirmation()
            }
        }
    }
    
#if !os(macOS)
    @Test
    func invokedWhenNavigatingWithCover() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.navigate(to: .one, style: .cover) {
                confirmation()
            }
        }
    }
#endif
    
#if !os(watchOS)
    @Test
    func invokedWhenNavigatingWithPopover() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.navigate(to: .one, style: .popover) {
                confirmation()
            }
        }
    }
#endif
    
    @Test
    func invokedWhenPoppingToRootOnEmptyPath() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.popToRoot {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToRootOnNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.popToRoot {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToRootOnNonEmptyPresentation() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        await confirm { confirmation in
            controller.popToRoot {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToPresentationRootOnEmptyPath() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.popToPresentationRoot {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingPresentationRootOnNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.popToPresentationRoot {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToPresentationRootOnNonEmptyPresentation() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        await confirm { confirmation in
            controller.popToPresentationRoot {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingOnEmptyPath() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.pop {
                confirmation()
            }
            
        }
    }
    
    @Test
    func invokedWhenPoppingOnNonEmptyPath() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.pop {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingOnNonEmptyPresentation() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        await confirm { confirmation in
            controller.pop {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenRemovingExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.removeFrom(index: 0, from: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenRemovingNonExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.removeFrom(index: controller.path.endIndex, from: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenRemovingAfterExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        await confirm { confirmation in
            controller.removeAfter(index: 0, from: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenRemovingAfterNonExistingIndex() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.removeAfter(index: controller.path.endIndex, from: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenDismissingFromPresentingController() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        await confirm { confirmation in
            controller.dismiss(from: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenDismissingFromNotPresentingController() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.dismiss(from: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenDismissingToPresentingController() async {
        let controller = controller()
        controller.navigate(to: .one, style: .sheet)
        
        await confirm { confirmation in
            controller.dismiss(to: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenDismissingToNotPresentingController() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.dismiss(to: controller) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingBeforeExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        await confirm { confirmation in
            controller.popBefore(\.two) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingBeforeExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        await confirm { confirmation in
            controller.popBefore(.two) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingBeforeNonExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.popBefore(.two) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingBeforeNonExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.popBefore(.two) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        await confirm { confirmation in
            controller.popTo(\.one) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        controller.navigate(to: .two)
        
        await confirm { confirmation in
            controller.popTo(.one) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToNonExistingElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.popTo(.two) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPoppingToNonExistingCasePathableElement() async {
        let controller = controller()
        controller.navigate(to: .one)
        
        await confirm { confirmation in
            controller.popTo(.two) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPushing() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.push(screen: .one, animated: true) {
                confirmation()
            }
        }
    }
    
    @Test
    func invokedWhenPresentingSheet() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.present(
                screen: .one,
                style: .sheet,
                dismissable: true,
                animated: true,
            ) {
                confirmation()
            }
        }
    }
    
#if !os(macOS)
    @Test
    func invokedWhenPresentingCover() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.present(
                screen: .one,
                style: .cover,
                dismissable: true,
                animated: true,
            ) {
                confirmation()
            }
        }
    }
#endif
    
#if !os(watchOS)
    @Test
    func invokedWhenPresentingPopover() async {
        let controller = controller()
        
        await confirm { confirmation in
            controller.present(
                screen: .one,
                style: .popover,
                dismissable: true,
                animated: true,
            ) {
                confirmation()
            }
        }
    }
#endif
    
    private func controller() -> RootNavigationController<Destination> {
        RootNavigationController()
    }
}
