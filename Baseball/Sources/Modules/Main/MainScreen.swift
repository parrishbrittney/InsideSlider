
import SwiftUI

struct MainScreen: View {
    @ObservedObject private var viewModel: MainViewModel
    @Binding var path: NavigationPath
    let date = Date()
    
    init(viewModel: MainViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(dateFormatted(date: date, format: "EEEE"))
                            .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                            .font(.custom("firasanscondensed-regular", size: 44))
                        Spacer()
                        Text(dateFormatted(date: date, format: "dd.MM"))
                            .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                            .font(.custom("firasanscondensed-regular", size: 24))
                    }
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 4) {
                            ForEach(viewModel.items, id: \.self) { item in
                                ItemView(viewModel: item) { item in
                                    path.append(Router.exerciseDetails(item))
                                }
                            }
                        }
                        .padding(.bottom, 92)
                    }
                    .padding(.bottom, 142)
                    Spacer()
                }
                
                MainCustomSwitcher(selectedOption: $viewModel.category)
                    .padding(.bottom, 102)
            }
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
        .onAppear {
            let savedCategory = UserDefaults.standard.string(forKey: "selectedCategory")
            let category = Category(rawValue: savedCategory ?? "") ?? .easy
            viewModel.category = category
            if viewModel.items.isEmpty {
                loadData()
            }
        }
        .onChange(of: viewModel.category) { _ in
            loadData()
        }
    }
    
    func loadData() {
        switch viewModel.category {
        case .easy:
            viewModel.easyLoadData()
        case .medium:
            viewModel.mediumLoadData()
        case .hard:
            viewModel.hardLoadData()
        }
    }

    func dateFormatted(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
}


#Preview {
    MainScreen(viewModel: .init(items: [
        .init(id: "1", image: "mainItemComleteIcon", title: "Exercise 1", description: "asdf"),
//        .init(id: "3", image: "mainItemArrowIcon", title: "Exercise 2", description: "asdf"),
//        .init(id: "4", image: "mainItemArrowIcon", title: "Exercise 1", description: "asdf"),
        .init(id: "5", image: "mainItemArrowIcon", title: "Exercise 3", description: "asdf")
    ], category: .easy), path: .constant(.init()))
}
