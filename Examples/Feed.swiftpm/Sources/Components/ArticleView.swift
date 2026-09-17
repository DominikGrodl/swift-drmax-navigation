import SwiftUI

struct ArticleView: View {
    let article: Article
    let isBookmarked: Bool
    let addBookmard: () -> Void
    let removeBookmark: () -> Void
    let sourceTapped: () -> Void
    let articleTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                SourceView(
                    source: article.source,
                    onTapped: sourceTapped
                )
                
                Spacer()
            }
            
            Text(article.title)
                .font(.headline)
            
            HStack(alignment: .bottom) {
                if let perex = article.sections.first?.text {
                    Text(perex)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                if isBookmarked {
                    Image(systemName: "bookmark.fill")
                        .font(.footnote)
                        .foregroundStyle(Color.accentColor)
                }
            }
        }
        .onTapGesture(perform: articleTapped)
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            if isBookmarked {
                Button("Remove bookmark", systemImage: "bookmark.slash") {
                    removeBookmark()
                }
                .tint(.red)
            } else {
                Button("Bookmark", systemImage: "bookmark") {
                    addBookmard()
                }
                .tint(.accentColor)
            }
        }
    }
}
