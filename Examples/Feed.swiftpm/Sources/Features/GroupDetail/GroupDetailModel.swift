import Observation

@Observable
final class GroupDetailModel: HashableObject {
    let title: String
    
    let posts: [Post]
    
    var navigate: (NavigationAction) -> Void
    
    enum NavigationAction {
        case post(Post)
        case dismiss
    }
    
    init(
        groupName: String,
        navigate: @escaping (NavigationAction) -> Void
    ) {
        self.title = groupName
        self.posts = .mock(groupName: groupName)
        self.navigate = navigate
    }
    
    func closeButtonTapped() {
        navigate(.dismiss)
    }
    
    func postTapped(_ post: Post) {
        navigate(.post(post))
    }
}
