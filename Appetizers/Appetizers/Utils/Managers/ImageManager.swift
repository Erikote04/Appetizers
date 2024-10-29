//
//  ImageManager.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import SwiftUI

final class ImageManager: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadImage(from url: String) {
        NetworkManager.shared.downloadImage(url: url) { UIImage in
            guard let UIImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: UIImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    @StateObject var imageManager = ImageManager()
    
    let url: String
    
    var body: some View {
        RemoteImage(image: imageManager.image)
            .onAppear {
                imageManager.loadImage(from: url)
            }
    }
}
