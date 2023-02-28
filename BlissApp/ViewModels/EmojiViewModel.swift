//
//  UserViewModel.swift
//  BlissApp
//
//  Created by Eren Erten on 17.02.2023.
//

import Foundation
import RxSwift
import RxRelay

class EmojiViewModel {
    
    let request = APIRequest()
    var element: Observable<[String:String]>?
    
    var emojiModelArray = BehaviorRelay<[EmojiModel]>(value: [])
    var emojiModelArray$: Observable<[EmojiModel]> {
        return emojiModelArray.asObservable()
    }
    
    var emojiFilteredModelArray$: Observable<[EmojiModel]>?
    
    private let disposeBag = DisposeBag()
    
    init(){
    }

    
    
    
    
    
}
    




