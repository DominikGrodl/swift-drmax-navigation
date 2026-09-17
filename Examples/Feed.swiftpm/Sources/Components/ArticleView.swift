import SwiftUI

struct ArticleView: View {
    let article: Article
    let sourceTapped: () -> Void
    let articleTapped: () -> Void
    let authorTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                SourceView(
                    source: article.source,
                    onTapped: sourceTapped
                )
                
                Spacer()
                
                AuthorView(
                    authorName: article.authorName,
                    imageUrlString: article.authorHeadshotUrl,
                    onTapped: authorTapped
                )
            }
            
            Text(article.title)
                .font(.headline)
            
            if let perex = article.sections.first?.text {
                Text(perex)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .onTapGesture(perform: articleTapped)
    }
}
