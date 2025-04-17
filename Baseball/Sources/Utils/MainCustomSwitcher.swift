
import SwiftUI

struct MainCustomSwitcher: View {
    @Binding var selectedOption: Category
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color(red: 197/255, green: 211/255, blue: 228/255))
                .frame(height: 40)
            
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color(red: 30/255, green: 30/255, blue: 30/255))
                    .frame(width: geo.size.width / 3, height: 40)
                    .offset(x: getOffset(width: geo.size.width))
                    .animation(.easeInOut(duration: 0.3), value: selectedOption)
            }
            
            HStack {
                ForEach(Category.allCases, id: \.self) { option in
                    Button(action: {
                        withAnimation {
                            selectedOption = option
                        }
                    }) {
                        Text(option.rawValue)
                            .font(.custom("firasanscondensed-regular", size: 16))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedOption == option
                                             ? Color(red: 228/255, green: 230/255, blue: 237/255)
                                             : Color(red: 30/255, green: 30/255, blue: 30/255)
                            )
                    }
                }
            }
        }
        .frame(height: 40)
    }
    
    private func getOffset(width: CGFloat) -> CGFloat {
        switch selectedOption {
        case .easy:
            return 0
        case .medium:
            return width / 3
        case .hard:
            return (width / 3) * 2
        }
    }
}

#Preview {
    MainCustomSwitcher(selectedOption: .init(projectedValue: .constant(.easy)))
}
