import SwiftUI

struct FeedDestinationView: View {
    let destination: FeedDestination
    
    var body: some View {
        switch destination {
        case let .postDetail(model):
            PostDetailView(model: model)
        case let .groupDetail(model):
            GroupDetailView(model: model)
        }
    }
}
