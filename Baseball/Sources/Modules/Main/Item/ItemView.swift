
import SwiftUI

struct ItemView: View {
    private var viewModel: ItemViewModel
    var onTap: ((ItemViewModel) -> Void)?
    
    init(viewModel: ItemViewModel, onTap: ((ItemViewModel) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onTap = onTap
    }
    var body: some View {
        HStack {
            Text(viewModel.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.init(red: 30/255, green: 30/255, blue: 30/255))
                .font(.custom("firasanscondensed-regular", size: 32))
                .lineLimit(1)
                .padding(.horizontal, 16)
            Image(.mainItemArrowIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(10)
        }
        .background(Color.init(red: 228/255, green: 230/255, blue: 237/255))
        .cornerRadius(20)
        .onTapGesture {
            onTap?(viewModel)
        }
    }
}

#Preview {
    ItemView(viewModel: .init(id: "1", image: "mainItemArrowIcon", title: "123", description: "asf"))
//        .padding(24)
}
