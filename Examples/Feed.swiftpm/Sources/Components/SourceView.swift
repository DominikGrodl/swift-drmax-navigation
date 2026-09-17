import SwiftUI

struct SourceView: View {
    let source: String
    let onTapped: () -> Void
    
    var body: some View {
        Text(source.uppercased())
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.accentColor)
            .onTapGesture(perform: onTapped)
    }
}
