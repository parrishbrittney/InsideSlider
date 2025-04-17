
import Foundation

final class QuizeDetailsViewModel: ObservableObject {
    var id: String
    @Published var title: String
    @Published var items: [QuizeDetailsItemViewModel]
    @Published var showCorrectAnswer: Bool = false
    @Published var isFinished: Bool = false
    
    init(id: String = "", title: String = "", items: [QuizeDetailsItemViewModel] = []) {
        self.id = id
        self.title = title
        self.items = items
        
        // Make sure we have at least one correct answer
        if !items.isEmpty && !items.contains(where: { $0.isCorrect }) {
            items[0].isCorrect = true
        }
    }
    
    func selectItem(_ selectedItem: QuizeDetailsItemViewModel) {
        // Reset all selections
        for i in 0..<items.count {
            items[i].isSelected = false
        }
        
        // Select the chosen item
        if let index = items.firstIndex(where: { $0.id == selectedItem.id }) {
            items[index].isSelected = true
            // Trigger UI update
            objectWillChange.send()
        }
    }
    
    func showAnswer() {
        showCorrectAnswer = true
    }
    
    func resetSelection() {
        showCorrectAnswer = false
        for i in 0..<items.count {
            items[i].isSelected = false
        }
        // Trigger UI update
        objectWillChange.send()
    }
}
