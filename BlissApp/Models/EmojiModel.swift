//
//  Model1.swift
//  BlissApp
//
//  Created by Eren Erten on 18.02.2023.
//

import Foundation
import UIKit


class EmojiModel {
    var emojiImage:UIImage?
    var emojiURL: String?
    var emojiName: String?
    
    init(emojiImage: UIImage? = nil, emojiURL: String? = nil, emojiName: String? = nil) {
        self.emojiImage = emojiImage
        self.emojiURL = emojiURL
        self.emojiName = emojiName
    }
}
class EmojiModelForSearch:Codable{
    var emojiURL: String?
    var emojiName: String?
    
    init( emojiURL: String? = nil, emojiName: String? = nil) {
        self.emojiURL = emojiURL
        self.emojiName = emojiName
    }
}
