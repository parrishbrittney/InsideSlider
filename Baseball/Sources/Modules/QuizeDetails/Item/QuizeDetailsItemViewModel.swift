
import Foundation

final class QuizeDetailsItemViewModel: ObservableObject, Identifiable, Hashable {
    var id: String
    var title: String
    var isCorrect: Bool
    @Published var isSelected: Bool = false
    
    init(id: String, title: String, isCorrect: Bool = false) {
        self.id = id
        self.title = title
        self.isCorrect = isCorrect
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: QuizeDetailsItemViewModel, rhs: QuizeDetailsItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
