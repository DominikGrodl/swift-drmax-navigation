import SwiftUI

struct LoginView: View {
    @Bindable var model: LoginModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $model.email)
            SecureField("Password", text: $model.password)
            
            Button("Sign in") {
                model.loginButtonTapped()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Forgot password?") {
                model.forgottenPasswordButtonTapped()
            }
        }
    }
}
