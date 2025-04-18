
import SwiftUI

struct ExerciseDetailsScreen: View {
    @ObservedObject var viewModel: ExerciseDetailsViewModel
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: ExerciseDetailsViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(.backButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }

                    Text(viewModel.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("firasanscondensed-regular", size: 32))
                        .foregroundStyle(Color(red: 30/255, green: 30/255, blue: 30/255))
                }
                .padding(20)
                .background(
                    RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight])
                        .fill(Color(red: 228/255, green: 230/255, blue: 237/255))
                        .edgesIgnoringSafeArea(.top)
                )
                .padding(.horizontal, -10)
                
                Spacer()
                
                Image(viewModel.image)
                    .resizable()
                    .scaledToFill()
                ScrollView {
                    Text(viewModel.description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("firasanscondensed-regular", size: 16))
                        .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color(red: 26/255, green: 89/255, blue: 54/255))
                        .font(.custom("firasanscondensed-semibold", size: 24))
                }
                .padding(.vertical, 14)
                .background(Color.init(red: 0/255, green: 255/255, blue: 115/255))
                .cornerRadius(50)
                .shadow(color: Color.init(red: 0/255, green: 255/255, blue: 115/255, opacity: 0.45), radius: 4, x: 0, y: 1)
                .padding(.top, 20)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 32)
        }
        .ignoresSafeArea(.all, edges: .top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ExerciseDetailsScreen(viewModel: .init(id: "", title: "sdfsgfgsd", image: "easyLvl1", description: "sadsdfsdagsadfgdfagdfg"), path: .constant(.init()))
}
