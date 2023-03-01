//
//  MainViewModel.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import Foundation
import UIKit
import RxSwift
import RxRelay


protocol MainViewModelCoordinatorDelegate: AnyObject {
    func didTapAppleRepos()
    func didTapAvatarList()
    func didTapEmojiList()
}



class MainViewModel {
    
    var disposeBag = DisposeBag()
    let request = APIRequest()
   
    var element: Observable<[String:String]>?
    var randomImage$:Observable<UIImage>?
    var randomInt:BehaviorRelay<Int> = BehaviorRelay(value: -1)
    var randomInt$:Observable<Int>{
        randomInt.asObservable()
    }
    var searchedAvatar$:BehaviorRelay<AvatarModel> = BehaviorRelay(value: AvatarModel())
    var emojiURL:BehaviorRelay<String> = BehaviorRelay(value: "")
    
    let emojiViewModel = BehaviorRelay<[EmojiModel]>(value: [])
    var emojiViewModel$: Observable<[EmojiModel]> {
        return emojiViewModel.asObservable()
    }
    
    
    init() {
        fetchEmojiList()
        bindObserver()
    }
    
    func bindObserver(){
        Observable.combineLatest(emojiViewModel$, randomInt$, resultSelector: { emojiList, randomNumber in
            if(randomNumber != -1){
                self.emojiURL.accept(emojiList[randomNumber].emojiURL!)
            }
        }).subscribe(onNext: { (observer) in
        }).disposed(by: disposeBag)
    }
    
    public weak var coordinatorDelegate: MainViewModelCoordinatorDelegate?
    
    public func onTapAppleRepos() {
      self.coordinatorDelegate?.didTapAppleRepos()
    }
  
    public func onTapAvatarLists() {
      self.coordinatorDelegate?.didTapAvatarList()
    }
    
    public func onTapEmojiList(){
        self.coordinatorDelegate?.didTapEmojiList()
    }
    public func onTapSearchButton(userName:String){
        request.callAPIWithStandardModelObject(router: .getUserInfo(userName: userName), objectType: AvatarModel.self).subscribe(onNext: { (value) in
            self.searchedAvatar$.accept(value)
        }).disposed(by: disposeBag)
        
    }
    func fetchEmojiList() {
        element = request.callAPIWithoutStandardModelObject(router:Router.getEmojis)
        element?.subscribe(
            onNext: {(valueDict) in
                var emojiList = [EmojiModel]()
                for value in valueDict {
                    let emoji = EmojiModel()
                    emoji.emojiURL = value.value
                    emoji.emojiName = value.key
                    emojiList.append(emoji)
                }
                
                self.emojiViewModel.accept(emojiList)
            },
            onError: {(error) in
                _ = self.emojiViewModel.catch({
                    (error) in
                    Observable.empty()
                })
            }).disposed(by: disposeBag)
    }
    
    public func onTapRandomEmoji(){
        emojiViewModel$.filter({ (value) in
            return !value.isEmpty
        }).subscribe(onNext: { (value) in
            let randomNumber = Int.random(in: 0..<value.count)
            self.randomInt.accept(randomNumber)
        }).disposed(by: disposeBag)
    }
}

    


