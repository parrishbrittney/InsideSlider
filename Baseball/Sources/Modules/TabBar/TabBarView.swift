

import SwiftUI

struct TabBarView: View {
    @Binding private var path: NavigationPath
    @ObservedObject private var viewModel: TabBarViewModel
    @ObservedObject var authMain: AuthMain
    
    init(viewModel: TabBarViewModel, authMain: AuthMain, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self.authMain = authMain
        self._path = path
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.current) {
                MainScreen(viewModel: .init(items: viewModel.easyLoadData(), category: .easy), path: $path)
                    .tag("home")

                QuizeListScreen(viewModel: .init(items: [
                    .init(id: "1", image: "quizIcon1", title: "Rooles of baseball", description: ""),
                    .init(id: "2", image: "quizIcon2", title: "Rooles of baseball", description: ""),
                    .init(id: "3", image: "quizIcon3", title: "Rooles of baseball", description: ""),
                    .init(id: "4", image: "quizIcon4", title: "Rooles of baseball", description: ""),
                    .init(id: "5", image: "quizIcon5", title: "Rooles of baseball", description: ""),
                    .init(id: "6", image: "quizIcon6", title: "Rooles of baseball", description: ""),
                    .init(id: "7", image: "quizIcon7", title: "Rooles of baseball", description: ""),
                    .init(id: "8", image: "quizIcon8", title: "Rooles of baseball", description: ""),
                    .init(id: "9", image: "quizIcon9", title: "Rooles of baseball", description: ""),
                    .init(id: "10", image: "quizIcon10", title: "Rooles of baseball", description: ""),
                    .init(id: "11", image: "quizIcon11", title: "Rooles of baseball", description: ""),
                    .init(id: "12", image: "quizIcon12", title: "Rooles of baseball", description: ""),
                    .init(id: "13", image: "quizIcon13", title: "Rooles of baseball", description: ""),
                    .init(id: "14", image: "quizIcon14", title: "Rooles of baseball", description: ""),
                    .init(id: "15", image: "quizIcon15", title: "Rooles of baseball", description: ""),
                    .init(id: "816", image: "quizIcon16", title: "Rooles of baseball", description: "")
                ]), path: $path)
                    .tag("quiz")

                FactsScreen(viewModel: .init(), path: $path)
                    .tag("info")

                AccountScreen(viewModel: .init(), authMain: authMain, path: $path)
                    .tag("account")
            }
            
            HStack(spacing: 4) {
                TabBarItem(title: "home", image: "homeIcon", selected: $viewModel.current)
                Spacer()
                TabBarItem(title: "quiz", image: "quizeIcon", selected: $viewModel.current)
                Spacer()
                TabBarItem(title: "info", image: "factsIcon", selected: $viewModel.current)
                Spacer()
                TabBarItem(title: "account", image: "profileIcon", selected: $viewModel.current)
            }
            .frame(maxWidth: .infinity, maxHeight: 64)
            .padding(10)
            .background(Color.init(red: 34/255, green: 38/255, blue: 57/255, opacity: 0.6).blur(radius: 1))
            .cornerRadius(20)
            .padding(10)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TabBarView(viewModel: .init(), authMain: .init(), path: .constant(.init()))
}
