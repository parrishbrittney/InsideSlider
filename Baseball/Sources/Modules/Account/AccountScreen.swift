

import SwiftUI
import PhotosUI

struct AccountScreen: View {
    @ObservedObject private var viewModel: AccountViewModel
    @ObservedObject var authMain: AuthMain
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var showingImagePicker = false
    @State private var selectedImage: PhotosPickerItem? = nil
    
    init(viewModel: AccountViewModel, authMain: AuthMain, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self.authMain = authMain
        self._path = path
    }
    
    var body: some View {
        VStack {
            if let image = viewModel.displayImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .background(Color(red: 197/255, green: 197/255, blue: 197/255))
                    .cornerRadius(40)
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    .padding(.horizontal, 36)
                    .padding(.top, 60)
            } else {
                Image("")
                    .resizable()
                    .scaledToFit()
                    .background(Color(red: 197/255, green: 197/255, blue: 197/255))
                    .cornerRadius(40)
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    .padding(.horizontal, 36)
                    .padding(.top, 60)
            }
            
            Text(authMain.currentuser?.name ?? "Anonimous")
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                .font(.custom("firasanscondensed-regular", size: 32))
                .lineLimit(1)
            Spacer()
            HStack {
                Text(authMain.currentuser?.email ?? "Email")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(Color.init(red: 30/255, green: 30/255, blue: 30/255))
                    .font(.custom("firasanscondensed-regular", size: 32))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
            }
            .background(Color(red: 228/255, green: 230/255, blue: 237/255))
            .padding(.horizontal, -10)
            Spacer()
            
            Button {
                showAlert = true
            } label: {
                Text("Delete account")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-semibold", size: 24))
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
            .cornerRadius(50)
            .padding(.bottom, 12)
            .alert("Are you sure?", isPresented: $showAlert) {
                Button("Delete", role: .destructive) {
                    authMain.deleteUserAccount { result in
                        switch result {
                        case .success():
                            print("Account deleted successfully.")
                            authMain.userSession = nil
                            authMain.currentuser = nil
                            path.removeLast(path.count - 1)
                        case .failure(let error):
                            print("ERROR DELELETING: \(error.localizedDescription)")
                        }
                    }
                }
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text("Are you sure you want to delete the account?")
            }
            
            Button {
                authMain.signOut()
                path.removeLast(path.count - 1)
            } label: {
                Text("Log out")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-semibold", size: 24))
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
            .cornerRadius(50)
            .padding(.bottom, 104)
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
        .photosPicker(
            isPresented: $showingImagePicker,
            selection: $selectedImage,
            matching: .images,
            photoLibrary: .shared()
        )
        .onChange(of: selectedImage) { item in
            if let item = item {
                viewModel.saveProfileImage(item: item)
            }
        }
    }
}

#Preview {
    AccountScreen(viewModel: .init(), authMain: .init(), path: .constant(.init()))
}
