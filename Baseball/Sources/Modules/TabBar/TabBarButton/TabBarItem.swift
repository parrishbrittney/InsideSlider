
import SwiftUI

struct TabBarItem: View {
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        Button {
            withAnimation(.spring) {
                selected = title
            }
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 35, height: 35)
                    .foregroundStyle(selected == title
                                     ? Color.init(red: 42/255, green: 46/255, blue: 65/255)
                                     : Color.init(red: 228/255, green: 230/255, blue: 237/255)
                    )
            }
        }
        .padding(10)
        .background(selected == title
                    ? Color.init(red: 228/255, green: 230/255, blue: 237/255)
                    : .clear
        )
        .cornerRadius(10)
    }
}

#Preview {
    TabBarItem(title: "sadasfsad", image: "profileIcon", selected: .init(get: {
        ""
    }, set: { _ in
        
    }))
    .background(.black)
}
