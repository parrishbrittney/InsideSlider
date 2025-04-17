
import Foundation
import SwiftUI
import Combine

final class FactsViewModel: ObservableObject {
    @Published var facts: String = "Loading interesting baseball facts..."
    @Published var isLoading: Bool = false
    
    private let geminiService: GeminiService
    
    // API-ключ
//    private let apiKey = "AIzaSyBBg4_zAfv7JXtXgi_VCKtD0sQ92awA6uo"
    private let apiKey = ""
    
    init() {
        self.geminiService = GeminiService(apiKey: apiKey)
        loadFact()
    }
    
    func loadFact() {
        isLoading = true
        
        Task {
            do {
                let fact = try await geminiService.generateBaseballFact()
                await MainActor.run {
                    self.facts = fact
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.facts = "Could not load baseball fact: \(error.localizedDescription)"
                }
            }
        }
    }
}
