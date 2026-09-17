import SwiftUI

struct AuthorView: View {
    let authorName: String
    let imageUrlString: String
    let onTapped: () -> Void
    
    var body: some View {
        HStack {
            Text(authorName)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            AsyncImage(url: URL(string: imageUrlString)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color(.tertiarySystemFill)
            }
            .frame(width: 22, height: 22)
            .clipShape(.circle)
        }
        .onTapGesture(perform: onTapped)
    }
}
