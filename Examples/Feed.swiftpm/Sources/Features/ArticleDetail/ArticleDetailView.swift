import SwiftUI

struct ArticleDetailView: View {
    let model: ArticleDetailModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text(model.article.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    SourceView(
                        source: model.article.source,
                        onTapped: model.sourceButtonTapped
                    )
                    
                    Spacer()
                    
                    AuthorView(
                        authorName: model.article.authorName,
                        imageUrlString: model.article.authorHeadshotUrl,
                        onTapped: model.authorButtonTapped
                    )
                }
                
                ForEach(
                    model.article.sections,
                    id: \.title,
                    content: sectionView
                )
            }
            .padding()
        }
        .navigationTitle(model.article.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(
                    model.bookmarkButtonTitle,
                    systemImage: model.bookmarkImageSystemName,
                    action: model.bookmarkButtonTapped
                )
            }
        }
    }
    
    private func sectionView(section: Article.Section) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(section.text)
        }
    }
}
