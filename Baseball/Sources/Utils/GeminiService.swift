

import Foundation
import GoogleGenerativeAI

class GeminiService {
    private let apiKey: String
    private var model: GenerativeModel
    
    init(apiKey: String) {
        self.apiKey = apiKey
        
        self.model = GenerativeModel(name: "gemini-1.5-flash", apiKey: apiKey)
    }
    
    func generateBaseballFact() async throws -> String {
        let prompt = "Generate one interesting fact about baseball. Make it concise (2-3 sentences), fascinating, and suitable for baseball fans. Provide only the fact without additional text."
        
        do {
            let response = try await model.generateContent(prompt)
            
            if let text = response.text {
                return text.trimmingCharacters(in: .whitespacesAndNewlines)
            } else {
                throw NSError(domain: "GeminiService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Empty response"])
            }
        } catch {
            print("Gemini error: \(error)")
            throw error
        }
    }
}
