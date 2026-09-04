import DrMaxNavigation
import Observation
import CasePaths

@CasePathable
enum FeedDestination: Hashable {
    case postDetail(PostDetailModel)
    case groupDetail(GroupDetailModel)
}

@Observable
final class FeedCoordinator<ParentDestination: Hashable & CasePathable>: HashableObject {
    let controller: NavigationController<ParentDestination, FeedDestination>
    let feedModel: FeedModel
    
    init(
        controller: NavigationController<ParentDestination, FeedDestination>
    ) {
        self.controller = controller
        
        self.feedModel = FeedModel()
        
        feedModel.navigate = { [weak self] action in
            self?.handleFeedNavigation(action: action)
        }
    }
    
    private func handleFeedNavigation(action: FeedModel.NavigationAction) {
        switch action {
        case let .postDetail(post): navigateToPostDetail(post: post)
        case let .group(name): navigateToGroup(name: name)
        }
    }
    
    private func handleGroupNavigation(action: GroupDetailModel.NavigationAction) {
        switch action {
        case let .post(post): navigateToPostDetail(post: post)
        case .dismiss: dismissGroupDetail()
        }
    }
    
    private func handlePostNavigation(action: PostDetailModel.NavigationAction) {
        switch action {
        case let .group(name): navigateToGroup(name: name)
        }
    }
    
    private func navigateToPostDetail(post: Post) {
        let model = PostDetailModel(post: post)
        
        model.navigate = { [weak self] action in
            self?.handlePostNavigation(action: action)
        }
        
        controller.navigate(to: .postDetail(model))
    }
    
    private func navigateToGroup(name: String) {
        let model = GroupDetailModel(
            groupName: name,
            navigate: { [weak self] action in
                self?.handleGroupNavigation(action: action)
            }
        )
        
        controller.navigate(to: .groupDetail(model), style: .sheet)
    }
    
    private func dismissGroupDetail() {
        controller.popBefore(\.groupDetail)
    }
}
