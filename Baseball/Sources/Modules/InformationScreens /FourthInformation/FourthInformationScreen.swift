
import SwiftUI

struct FourthInformationScreen: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("PATH TO EXCELLENCE")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-bold", size: 44))
                    .padding(.horizontal, 10)
                    .padding(.top, 16)
                
                Text("Workouts anywhere for pitching, hitting and fielding.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-regular", size: 32))
                    .padding(.horizontal, 10)
                
                Button {
                    path.append(Router.tabBarView)
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .font(.custom("firasanscondensed-semibold", size: 24))
                }
                .padding(.vertical, 14)
                .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
                .cornerRadius(50)
                .padding(.horizontal, 10)
                .padding(.top, 50)
                .padding(.bottom, 38)
            }
            .background(
                Image(.mainOnboarding)
                    .resizable()
            )
            .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.fourthInfoBackground)
                .resizable()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    FourthInformationScreen(path: .constant(.init()))
}
