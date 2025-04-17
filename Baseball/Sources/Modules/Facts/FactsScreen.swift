
import SwiftUI

struct FactsScreen: View {
    @ObservedObject private var viewModel: FactsViewModel
    @Binding var path: NavigationPath
    
    init(viewModel: FactsViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        VStack {
            Text("Facts about baseball")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                .font(.custom("firasanscondensed-regular", size: 44))
            
            ScrollView {
                Text(viewModel.facts)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-regular", size: 16))
            }
            .scrollIndicators(.hidden)
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
        .onAppear {
            viewModel.loadFact()
        }
    }
}

#Preview {
    FactsScreen(viewModel: .init(), path: .constant(.init()))
}
