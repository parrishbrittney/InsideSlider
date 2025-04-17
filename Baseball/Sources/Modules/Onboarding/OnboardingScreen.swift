
import SwiftUI

struct OnboardingScreen: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Image(.loader)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 80)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimating)
            
            Text("Loading...")
                .font(.custom("firasanscondensed-bold", size: 44))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    OnboardingScreen()
}
