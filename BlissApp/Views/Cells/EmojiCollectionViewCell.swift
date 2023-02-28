//
//  EmojiTableViewCell.swift
//  BlissApp
//
//  Created by Eren Erten on 20.02.2023.
//

import UIKit

class EmojiCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var emojiImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(emoji: EmojiModel){
        emojiImage.setImageFromStringrURL(stringUrl: emoji.emojiURL!)
        emoji.emojiImage = emojiImage.image ?? UIImage()
    }
}
