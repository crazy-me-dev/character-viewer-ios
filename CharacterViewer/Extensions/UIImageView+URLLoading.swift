//
//  UIImage+URLLoading.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation
import UIKit

extension UIImageView {
    func showImage(fromURL url: URL, completed: @escaping () -> Void, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                completed()
            }
        }.resume()
    }
    func showImage(fromLink link: String, completed: @escaping () -> Void, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        showImage(fromURL: url, completed: completed, contentMode: mode)
    }
}
