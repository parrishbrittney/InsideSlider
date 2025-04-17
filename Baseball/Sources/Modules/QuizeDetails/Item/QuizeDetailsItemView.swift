
import SwiftUI

struct QuizeDetailsItemView: View {
    @ObservedObject private var viewModel: QuizeDetailsItemViewModel
    var onTap: ((QuizeDetailsItemViewModel) -> Void)?
    var showCorrectAnswer: Bool
    
    init(viewModel: QuizeDetailsItemViewModel,
         showCorrectAnswer: Bool = false,
         onTap: ((QuizeDetailsItemViewModel) -> Void)? = nil)
    {
        self.viewModel = viewModel
        self.showCorrectAnswer = showCorrectAnswer
        self.onTap = onTap
    }
    
    var body: some View {
        Text(viewModel.title)
            .frame(maxWidth: .infinity)
            .foregroundStyle(getBorderColor())
            .font(.custom("firasanscondensed-regular", size: 24))
//            .lineLimit(1)
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            .background(getBackgroundColor())
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(getBorderColor(), lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .cornerRadius(50)
            .onTapGesture {
                if !showCorrectAnswer {
                    viewModel.isSelected = true
                    onTap?(viewModel)
                }
            }
    }
    
    private func getBorderColor() -> Color {
         if showCorrectAnswer {
             if viewModel.isCorrect {
                 return Color.green
             } else if viewModel.isSelected {
                 return Color.red
             } else {
                 return Color(red: 238/255, green: 215/255, blue: 220/255)
             }
         } else {
             return viewModel.isSelected
             ? Color(red: 255/255, green: 0/255, blue: 60/255)
             : Color(red: 238/255, green: 215/255, blue: 220/255)
         }
     }
     
     private func getBackgroundColor() -> Color {
         if showCorrectAnswer && viewModel.isCorrect {
             return Color.green.opacity(0.3)
         } else if viewModel.isSelected {
             return Color(red: 255/255, green: 0/255, blue: 60/255).opacity(0.1)
         } else {
             return .clear
         }
     }
 }


#Preview {
    QuizeDetailsItemView(viewModel: .init(id: "1", title: "фыв"))
}
