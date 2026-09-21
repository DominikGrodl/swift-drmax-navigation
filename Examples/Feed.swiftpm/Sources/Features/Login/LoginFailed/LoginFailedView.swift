import SwiftUI

struct LoginFailedView: View {
    let model: LoginFailedModel
    
    var body: some View {
        VStack {
            Text("Uh-oh")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Login failed")
                .foregroundStyle(.secondary)
            
            HStack {
                Button("Try again", action: model.tryAgainButtonTapped)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .buttonBorderShape(.capsule)
                
                Button("Close", action: model.closeButtonTapped)
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .buttonBorderShape(.capsule)
            }
        }
    }
}
