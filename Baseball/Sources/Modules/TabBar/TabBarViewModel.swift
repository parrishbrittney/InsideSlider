

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var current = "home"
    @Published var isTabBarShown = true
    
    func easyLoadData() -> [ItemViewModel] {
        let storage: ModelStorage = .init()
        
        let levelItems: [ItemViewModel] = storage.read().first?.easyExers
            .compactMap { makeEasyCell(for: $0) } ?? []
        
        return levelItems
    }
    
    func makeEasyCell(
        for model: EasyDomainModel
    ) -> ItemViewModel? {
        return .init(id: model.id.uuidString, image: model.image, title: model.title, description: model.descriptions)
    }
}
