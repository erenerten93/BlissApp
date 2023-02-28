//
//  RepoModel.swift
//  BlissApp
//
//  Created by Eren Erten on 26.02.2023.
//

import Foundation

class RepoModel:Codable{
 
    let fullName:String?
    
    private enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }

    init(fullName:String?) {
        self.fullName = fullName
    }
}
