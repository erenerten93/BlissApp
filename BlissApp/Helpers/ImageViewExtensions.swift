//
//  ImageViewExtensions.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import Foundation
import UIKit
import RxSwift

extension UIImageView {
    func setImageFromStringrURL(stringUrl: String) {
        if let url = URL(string: stringUrl) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          // Error handling...
          guard let imageData = data else { return }
          DispatchQueue.main.async {
              self.image = UIImage(data: imageData)
          }
        }.resume()
      }
    }
}
