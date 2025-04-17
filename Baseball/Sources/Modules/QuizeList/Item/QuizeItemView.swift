
import SwiftUI

struct QuizeItemView: View {
    @ObservedObject private var viewModel: QuizeItemViewModel
    var onTap: ((QuizeItemViewModel) -> Void)?
    
    init(viewModel: QuizeItemViewModel, onTap: ((QuizeItemViewModel) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onTap = onTap
    }
    var body: some View {
        
        
        VStack {
            Button {
                onTap?(viewModel)
            } label: {
                Text(viewModel.title)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.init(red: 228/255, green: 230/255, blue: 237/255))
                    .font(.custom("firasanscondensed-bold", size: 16))
                    .lineLimit(1)
                    .padding(.vertical, 12)
                    .background(Color(red: 255/255, green: 0/255, blue: 60/255))
                    .cornerRadius(40)
                    .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(viewModel.image)
                .resizable()
//                .scaledToFit()
        )
        .cornerRadius(20)
    }
}

#Preview {
    QuizeItemView(viewModel: .init(id: "1", image: "mainItemArrowIcon", title: "Rooles of baseball", description: "asf"))
        .frame(width: 200, height: 200)
}
