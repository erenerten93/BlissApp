//
//  AvatarModel.swift
//  BlissApp
//
//  Created by Eren Erten on 26.02.2023.
//

import Foundation
import UIKit


class AvatarModel:Codable   {
    let avatarURL:String?
    let avatarName:String?
    
    private enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case avatarName = "login"
    }

    init(avatarURL:String?,avatarName:String?) {
        self.avatarURL = avatarURL
        self.avatarName = avatarName
    }
    init(){
        self.avatarURL = nil
        self.avatarName = nil
    }
}
