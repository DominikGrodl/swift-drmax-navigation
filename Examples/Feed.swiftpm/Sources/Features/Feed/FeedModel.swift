import Foundation
import Observation

@Observable
final class FeedModel {
    let posts: [Post]
    
    var navigate: (NavigationAction) -> Void = { _ in }
    
    enum NavigationAction {
        case postDetail(Post)
        case group(String)
    }
    
    init() {
        self.posts = .mock()
    }
    
    func groupTapped(name: String) {
        navigate(.group(name))
    }
    
    func postTapped(_ post: Post) {
        navigate(.postDetail(post))
    }
}
