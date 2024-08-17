//
//  ImageLoader.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-16.
//


//import SwiftUI
//
//class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//
//    private let url: URL
//    private var cache: ImageCache
//
//    init(url: URL, cache: ImageCache = Environment(\.imageCache).wrappedValue) {
//        self.url = url
//        self.cache = cache
//        loadImage()
//    }
//
//    private func loadImage() {
//        if let cachedImage = cache[self.url] {
//            self.image = cachedImage
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data, let uiImage = UIImage(data: data) else { return }
//            self.cache[self.url] = uiImage
//            DispatchQueue.main.async {
//                self.image = uiImage
//            }
//        }.resume()
//    }
//}
//
//protocol ImageCache {
//    subscript(_ url: URL) -> UIImage? { get set }
//}
//
//struct TemporaryImageCache: ImageCache {
//    private let cache = NSCache<NSURL, UIImage>()
//
//    subscript(_ url: URL) -> UIImage? {
//        get { cache.object(forKey: url as NSURL) }
//        set { newValue == nil ? cache.removeObject(forKey: url as NSURL) : cache.setObject(newValue!, forKey: url as NSURL) }
//    }
//}
//
//struct ImageCacheKey: EnvironmentKey {
//    static let defaultValue: ImageCache = TemporaryImageCache()
//}
//
//extension EnvironmentValues {
//    var imageCache: ImageCache {
//        get { self[ImageCacheKey.self] }
//        set { self[ImageCacheKey.self] = newValue }
//    }
//}
//
//struct AsyncImage<Placeholder: View>: View {
//    @StateObject private var loader: ImageLoader
//    private let placeholder: Placeholder
//
//    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
//        self.placeholder = placeholder()
//        _loader = StateObject(wrappedValue: ImageLoader(url: url))
//    }
//
//    var body: some View {
//        if let image = loader.image {
//            Image(uiImage: image).resizable()
//        } else {
//            placeholder
//        }
//    }
//}
