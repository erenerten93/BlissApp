//
//  Router.swift
//
//  Created by Eren Erten on 17.02.2023.
//  Copyright © 2023 Nineleaps. All rights reserved.
//

import Foundation

enum Router {
    case getEmojis
    case getUserInfo(userName:String)
    case getUserRepos(userName:String,queryList:[String:Int])
    
    var scheme: String {
        switch self {
        case .getEmojis, .getUserInfo, .getUserRepos:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getEmojis, .getUserInfo, .getUserRepos:
            return "api.github.com"
        }
    }
    // https:/api.github.com/emoj
    
    var path: String {
        switch self {
        case .getEmojis:
            return "/emojis"
        case .getUserInfo(let userName):
            return "/users/\(userName)"
        case .getUserRepos(let userName,_):
            return "/users/\(userName)/repos"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getEmojis:
            return []
        case .getUserInfo:
            return []
        case .getUserRepos(_,let queryList):
            return[
                URLQueryItem(name: "page", value:"\(queryList["page"] ?? 1)"),
                URLQueryItem(name: "size", value:"\(queryList["size"] ?? 20)")
            ]
            
        }
    }
    
    var method: String {
        switch self {
        case .getEmojis, .getUserInfo, .getUserRepos:
            return "GET"
        }
      }
}
