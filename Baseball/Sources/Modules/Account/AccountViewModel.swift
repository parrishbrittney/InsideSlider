

import Foundation
import SwiftUI
import PhotosUI

class AccountViewModel: ObservableObject {
    @Published var displayImage: UIImage?
    
    init() {
        loadProfileImage()
    }
    
    func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let savedImage = UIImage(data: imageData) {
            self.displayImage = savedImage
        }
    }
    
    func saveProfileImage(item: PhotosPickerItem) {
        item.loadTransferable(type: Data.self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let imageData):
                    if let data = imageData,
                       let uiImage = UIImage(data: data) {
                        self?.displayImage = uiImage
                        UserDefaults.standard.set(data, forKey: "userProfileImage")
                    }
                case .failure(let error):
                    print("Failed to load image: \(error)")
                }
            }
        }
    }
    
    func signOut() {
        // Ваша логика выхода из аккаунта
    }
}
