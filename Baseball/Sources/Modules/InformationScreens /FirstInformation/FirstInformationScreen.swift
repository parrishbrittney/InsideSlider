
import SwiftUI

struct FirstInformationScreen: View {
    @ObservedObject private var viewModel: FirstInformationViewModel
    @State private var path: NavigationPath = .init()
    @StateObject private var authMain = AuthMain()
    
    init(viewModel: FirstInformationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading, spacing: 8) {
                Image(.firstInfoScreenIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Text("Welcome")
                    .font(.custom("firasanscondensed-regular", size: 82))
                    .foregroundStyle(.white)
                Text("to our app")
                    .font(.custom("firasanscondensed-regular", size: 44))
                    .foregroundStyle(.white)
                Text("You can learn how to play baseball here")
                    .font(.custom("firasanscondensed-light", size: 24))
                    .foregroundStyle(.white)
                Spacer()
                Button {
                    path.append(Router.root)
                } label: {
                    Text("Log in")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("firasanscondensed-semibold", size: 24))
                        .foregroundStyle(.white)
                }
                .padding(.vertical, 14)
                .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
                .shadow(color: Color.init(red: 255/255, green: 0/255, blue: 60/255, opacity: 0.45), radius: 4, x: 0, y: 1)
                .cornerRadius(50)
                .padding(.bottom, 38)
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(.mainOnboarding)
                    .resizable()
                    .ignoresSafeArea()
            )
            .navigationDestination(for: Router.self) { router in
                switch router {
                case .onbord2:
                    SecondInformationScreen(path: $path)
                        .navigationBarBackButtonHidden(true)
                case .onbord3:
                    ThirdInformationScreen(path: $path)
                        .navigationBarBackButtonHidden(true)
                case .onbord4:
                    FourthInformationScreen(path: $path)
                        .navigationBarBackButtonHidden(true)
                case .main:
                    MainScreen(viewModel: .init(items: [], category: .easy), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .exerciseDetails(let item):
                    ExerciseDetailsScreen(viewModel: .init(id: item.id, title: item.title, image: item.image, description: item.description), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .quiz:
                    QuizeListScreen(viewModel: .init(items: []), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .quizDetails(let item):
                    QuizeDetailsScreen(viewModel: .init(id: item.id, title: item.title, items: []), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .account:
                    AccountScreen(viewModel: .init(), authMain: authMain, path: $path)
                        .navigationBarBackButtonHidden(true)
                case .root:
                    RootScreen(viewModel: authMain, path: $path)
                        .navigationBarBackButtonHidden(true)
                case .tabBarView:
                    TabBarView(viewModel: .init(), authMain: authMain, path: $path)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    FirstInformationScreen(viewModel: .init())
}
