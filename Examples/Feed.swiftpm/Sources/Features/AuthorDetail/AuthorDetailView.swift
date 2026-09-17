import SwiftUI

struct AuthorDetailView: View {
    let model: AuthorDetailModel
    
    var body: some View {
        List(model.articles) {
            ArticleCellView(model: $0)
        }
        .listStyle(.plain)
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Close", systemImage: "xmark") {
                    model.closeButtonTapped()
                }
            }
        }
    }
}
