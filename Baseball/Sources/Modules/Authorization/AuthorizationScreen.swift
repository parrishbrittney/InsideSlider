
import SwiftUI

struct AuthorizationScreen: View {
    @State private var email = ""
    @State private var password = ""
    
//    @State private var email = ""
    @State private var name = ""
//    @State private var password = ""
    @State private var confirmPassword = ""
    
    @ObservedObject var viewModel: AuthMain
    @State private var isNotificationShown = false
    @State private var isAlertShown = false
    @State private var isAuth = true
    
    @Binding var path: NavigationPath
    
    init(viewModel: AuthMain, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        if isAuth {
            authView
                .alert(isPresented: $isAlertShown) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.text),
                        dismissButton: .cancel()
                    )
                }
        } else {
            registrationView
                .alert(isPresented: $isNotificationShown) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please ensure your email address is valid and not empty, your password is at least 6 characters long, and your confirmation password matches your password."),
                        dismissButton: .cancel()
                    )
                }
        }
    }
    
    var authView: some View {
        VStack {
            HStack {
                Text("Log in")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 44))
                    .foregroundStyle(Color(red: 30/255, green: 30/255, blue: 30/255))
            }
            .padding(20)
//            .padding(.top, 54)
            .background(Color(red: 228/255, green: 230/255, blue: 237/255))
            .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight]))
            .padding(.horizontal, -10)
            
            TextField("", text: $email, prompt:
                Text("Email")
                    .font(.custom("firasanscondensed-regular", size: 24))
                    .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
            )
            .font(.custom("firasanscondensed-regular", size: 24))
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
            .background {
                Rectangle()
                    .foregroundColor(Color(red: 228/255, green: 230/255, blue: 237/255))
                    .cornerRadius(50)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.init(red: 108/255, green: 115/255, blue: 140/255), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .padding(.top, 80)
            
            SecureField(
                "",
                text: $password,
                prompt:
                    Text("Password")
                        .font(.custom("firasanscondensed-regular", size: 24))
                        .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
            )
                .font(.custom("firasanscondensed-regular", size: 24))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
                .background {
                    Rectangle()
                        .foregroundColor(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .cornerRadius(50)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.init(red: 108/255, green: 115/255, blue: 140/255), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Button {
                Task {
                    do {
                        try await viewModel.signIn(email: email, password: password)
                        if !viewModel.text.isEmpty {
                            isAlertShown = true
                        }
                    } catch {
                        isAlertShown = true
                    }
                }
            } label: {
                Text("Log in")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-semibold", size: 24))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
            .cornerRadius(50)
            
            Spacer()
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(Color(red: 238/255, green: 215/255, blue: 220/255))
                .padding(.horizontal, -10)
            
            Text("You can choose another way")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.custom("firasanscondensed-regular", size: 24))
                .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
            
            Spacer()
            
            Button {
                isAuth = false
            } label: {
                Text("Create an account")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 24))
                    .foregroundStyle(Color(red: 86/255, green: 17/255, blue: 33/255))
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 238/255, green: 215/255, blue: 220/255))
            .cornerRadius(50)
            
            Button {
                Task {
                    await viewModel.signInAnonymously()
                }
            } label: {
                Text("Anonimous")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 24))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 14)
            .background(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.init(red: 255/255, green: 0/255, blue: 60/255), lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .cornerRadius(50)
            .padding(.bottom, 38)
        }
        .ignoresSafeArea(.all, edges: .top)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
    }
    
    var registrationView: some View {
        VStack {
            HStack {
                Text("Registration")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 44))
                    .foregroundStyle(Color(red: 30/255, green: 30/255, blue: 30/255))
            }
            .padding(20)
//            .padding(.top, 54)
            .background(Color(red: 228/255, green: 230/255, blue: 237/255))
            .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight]))
            .padding(.horizontal, -10)
            
            TextField("", text: $name, prompt:
                        Text("Name")
                            .font(.custom("firasanscondensed-regular", size: 24))
                            .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
            )
                .font(.custom("firasanscondensed-regular", size: 24))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
                .background {
                    Rectangle()
                        .foregroundColor(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .cornerRadius(50)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.init(red: 108/255, green: 115/255, blue: 140/255), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            TextField("", text: $email, prompt:
                        Text("Email")
                            .font(.custom("firasanscondensed-regular", size: 24))
                            .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
                      
            )
                .font(.custom("firasanscondensed-regular", size: 24))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
                .background {
                    Rectangle()
                        .foregroundColor(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .cornerRadius(50)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.init(red: 108/255, green: 115/255, blue: 140/255), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            SecureField("", text: $password, prompt:
                            Text("Password")
                                .font(.custom("firasanscondensed-regular", size: 24))
                                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
            )
                .font(.custom("firasanscondensed-regular", size: 24))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
                .background {
                    Rectangle()
                        .foregroundColor(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .cornerRadius(50)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.init(red: 108/255, green: 115/255, blue: 140/255), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            SecureField("", text: $confirmPassword, prompt:
                            Text("Confirm password")
                                .font(.custom("firasanscondensed-regular", size: 24))
                                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
            )
                .font(.custom("firasanscondensed-regular", size: 24))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .foregroundColor(Color(red: 144/255, green: 138/255, blue: 138/255))
                .background {
                    Rectangle()
                        .foregroundColor(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .cornerRadius(50)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.init(red: 108/255, green: 115/255, blue: 140/255), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Button {
                if isFormValid {
                    Task {
                        do {
                            try await viewModel.createUser(withEmail: email, password: password, name: name)
                            if !viewModel.text.isEmpty {
                                isAlertShown = true
                            }
                        } catch {
                            isAlertShown = true
                        }
                    }
                } else {
                    isNotificationShown.toggle()
                }
            } label: {
                Text("Create an account")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-semibold", size: 24))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 255/255, green: 0/255, blue: 60/255))
            .cornerRadius(50)
            
            Spacer()
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(Color(red: 238/255, green: 215/255, blue: 220/255))
                .padding(.horizontal, -10)
            
            Text("You can choose another way")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.custom("firasanscondensed-regular", size: 24))
                .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
            
            Spacer()
            
            Button {
                isAuth = true
            } label: {
                Text("Log in")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 24))
                    .foregroundStyle(Color(red: 86/255, green: 17/255, blue: 33/255))
            }
            .padding(.vertical, 14)
            .background(Color.init(red: 238/255, green: 215/255, blue: 220/255))
            .cornerRadius(50)
            
            Button {
                Task {
                    await viewModel.signInAnonymously()
                }
            } label: {
                Text("Anonimous")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 24))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 14)
            .background(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.init(red: 255/255, green: 0/255, blue: 60/255), lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .cornerRadius(50)
            .padding(.bottom, 38)
        }
        .ignoresSafeArea(.all, edges: .top)
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
    AuthorizationScreen(viewModel: .init(), path: .constant(.init()))
}

extension AuthorizationScreen: AuthCoreProtocol {
    var isFormValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
    }
}
