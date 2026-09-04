import DrMaxNavigation
import Observation
import CasePaths

@CasePathable
enum PostDestination: Hashable {
    case postDetail(PostDetailModel)
    case groupDetail(GroupDetailModel)
}

final class PostCoordinator<ParentDestination: Hashable>: HashableObject {
    let controller: NavigationController<ParentDestination, PostDestination>
    let postModel: PostDetailModel
    
    init(
        post: Post,
        controller: NavigationController<ParentDestination, PostDestination>
    ) {
        self.controller = controller
        self.postModel = PostDetailModel(
            post: post
        )
        
        postModel.navigate = { [weak self] action in
            self?.handlePostNavigation(action: action)
        }
    }
    
    private func handlePostNavigation(action: PostDetailModel.NavigationAction) {
        switch action {
        case let .group(name): toGroupDetail(name: name)
        }
    }
    
    private func toGroupDetail(name: String) {
        
    }
}
