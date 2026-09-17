import SwiftUI

struct ArticleView<TopTrailingContent: View>: View {
    let article: Article
    let onArticleTapped: (Article) -> Void
    let onSourceTapped: (String) -> Void
    let topTrailingContent: () -> TopTrailingContent
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                SourceView(
                    source: article.source,
                    onTapped: { onSourceTapped(article.source) }
                )
                
                Spacer()
                
                topTrailingContent()
            }
            
            Text(article.title)
                .font(.headline)
            
            HStack {
                if let perex = article.sections.first?.text {
                    Text(perex)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .onTapGesture {
            onArticleTapped(article)
        }
    }
}

extension ArticleView where TopTrailingContent == EmptyView {
    init(
        article: Article,
        onSourceTapped: @escaping (String) -> Void,
        onArticleTapped: @escaping (Article) -> Void
    ) {
        self.init(
            article: article,
            onArticleTapped: onArticleTapped,
            onSourceTapped: onSourceTapped,
            topTrailingContent: { EmptyView() }
        )
    }
}
