
import SwiftUI

struct QuizeDetailsScreen: View {
    @ObservedObject private var viewModel: QuizeDetailsViewModel
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    @State private var isQuize: Bool = true
    
    init(viewModel: QuizeDetailsViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        if isQuize {
            quizeView
        } else {
            FinishQuizeScreen {
                dismiss()
            }
        }
    }
    
    var quizeView: some View {
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

                Text("Rooles of baseball")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("firasanscondensed-regular", size: 32))
                    .foregroundStyle(Color(red: 30/255, green: 30/255, blue: 30/255))
                    .padding(.trailing, 32)
            }
            .padding(20)
            .background(Color(red: 228/255, green: 230/255, blue: 237/255))
            .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight]))
            .padding(.horizontal, -10)
            
            Text(viewModel.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom("firasanscondensed-semibold", size: 32))
                .foregroundStyle(Color(red: 228/255, green: 230/255, blue: 237/255))
                .padding(.horizontal, 10)
                .padding(.top, 20)
            
            VStack(spacing: 10) {
                ForEach(viewModel.items, id: \.id) { item in
                    QuizeDetailsItemView(
                        viewModel: item,
                        showCorrectAnswer: viewModel.showCorrectAnswer
                    ) { selectedItem in
                        viewModel.selectItem(selectedItem)
                    }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
            
            Spacer()
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Back")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("firasanscondensed-semibold", size: 24))
                        .foregroundStyle(.white)
                }
                .padding(.vertical, 14)
                .background(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(red: 255/255, green: 0/255, blue: 60/255), lineWidth: 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .cornerRadius(50)
                
                Button {
                    if viewModel.showCorrectAnswer {
                        isQuize = false
                    } else {
                        viewModel.showAnswer()
                    }
                } label: {
                    Text(viewModel.showCorrectAnswer ? "Finish" : "Check Answer")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("firasanscondensed-semibold", size: 24))
                        .foregroundStyle(.white)
                }
                .padding(.vertical, 14)
                .background(Color(red: 255/255, green: 0/255, blue: 60/255))
                .cornerRadius(50)
                .disabled(!viewModel.items.contains(where: { $0.isSelected }) && !viewModel.showCorrectAnswer)
                .opacity(!viewModel.items.contains(where: { $0.isSelected }) && !viewModel.showCorrectAnswer ? 0.7 : 1)
            }
            .padding(.horizontal, 10)
        }
        .padding(.bottom, 24)
        .ignoresSafeArea(.all, edges: .top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.mainOnboarding)
                .resizable()
                .ignoresSafeArea()
        )
        .onAppear {
            loadQuiz()
        }
    }
    
    private func loadQuiz() {
        let quizzes = QuizRepository.getBaseballQuizzes().randomElement()
        if let quiz = quizzes {
            viewModel.id = quiz.id
            viewModel.title = quiz.title
            viewModel.items = quiz.items
        }
    }
}

#Preview {
    QuizeDetailsScreen(viewModel: .init(id: "", title: "Rooles of baseball", items: [
        QuizeDetailsItemViewModel(id: "1", title: "Strike", isCorrect: true),
        QuizeDetailsItemViewModel(id: "2", title: "Ball", isCorrect: false),
        QuizeDetailsItemViewModel(id: "3", title: "Foul", isCorrect: false)
    ]), path: .constant(.init()))
}
