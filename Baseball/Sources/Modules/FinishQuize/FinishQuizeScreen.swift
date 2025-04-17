
import SwiftUI

struct FinishQuizeScreen: View {
    var onTap: (() -> Void)?
    
    init(onTap: (() -> Void)? = nil) {
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            Text("Congratulations!")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.custom("firasanscondensed-semibold", size: 54))
                .foregroundStyle(Color(red: 30/255, green: 30/255, blue: 30/255))
            Text("you've answered the question")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.custom("firasanscondensed-regular", size: 24))
                .foregroundStyle(Color(red: 73/255, green: 74/255, blue: 81/255))
            
            Button {
                onTap?()
            } label: {
                Text("Back to home")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-semibold", size: 24))
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
            .cornerRadius(50)
            .padding(.top, 40)
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.finishQuizeBackground)
                .resizable()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    FinishQuizeScreen()
}
