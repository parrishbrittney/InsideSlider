
import SwiftUI

struct QuizeListScreen: View {
    @ObservedObject private var viewModel: QuizeListViewModel
    @Binding var path: NavigationPath
    
    init(viewModel: QuizeListViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Quizes")
                    .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-regular", size: 44))
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                    ForEach(viewModel.items, id: \.self) { item in
                        QuizeItemView(viewModel: item) { item in
                            path.append(Router.quizDetails(item))
                        }
                        .aspectRatio(1.0, contentMode: .fit)
                    }
                }
                .padding(.bottom, 92)
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
    }
}

#Preview {
    QuizeListScreen(viewModel: .init(items: [
        .init(id: "7", image: "quizIcon7", title: "Rooles of baseball", description: ""),
        .init(id: "8", image: "quizIcon8", title: "Rooles of baseball", description: "")
    ]), path: .constant(.init()))
}
