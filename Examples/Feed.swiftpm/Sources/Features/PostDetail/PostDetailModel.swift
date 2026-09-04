import Foundation
import Observation

final class PostDetailModel: HashableObject {
    let post: Post
    
    var navigate: (NavigationAction) -> Void = { _ in }
    
    enum NavigationAction {
        case group(String)
    }
    
    init(
        post: Post
    ) {
        self.post = post
    }
    
    func groupButtonTapped() {
        navigate(.group(post.groupName))
    }
}
