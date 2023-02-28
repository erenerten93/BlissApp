//
//  AvatarViewModel\.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import Foundation
import RxSwift


class AvatarViewModel {
    
    var disposeBag = DisposeBag()
    
    var avatarList:Observable<[AvatarModel]>?
    
}
