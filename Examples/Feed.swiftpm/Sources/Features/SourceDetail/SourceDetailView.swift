import SwiftUI

struct SourceDetailView: View {
    let model: SourceDetailModel
    
    var body: some View {
        List(model.articles) {
            ArticleCellView(model: $0)
        }
        .listStyle(.plain)
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
