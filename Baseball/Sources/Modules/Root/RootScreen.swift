
import SwiftUI

struct RootScreen: View {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var isJHKASD: Bool = true
    @ObservedObject var viewModel: AuthMain
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: AuthMain, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        if viewModel.userSession != nil {
            SecondInformationScreen(path: $path)
        } else {
            AuthorizationScreen(viewModel: viewModel, path: $path)
        }
    }
}

#Preview {
    RootScreen(viewModel: .init(), path: .constant(.init()))
}
