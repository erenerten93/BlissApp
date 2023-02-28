//
//  ReposViewModel.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import Foundation
import RxSwift
import RxRelay


class ReposViewModel {
    var newDataCame = true
    
    var disposeBag = DisposeBag()
    
    var request = APIRequest()
    var repoList$:Observable<[RepoModel]>?
    
    func fetchRepoList(){
        repoList$ = request.callAPIWithStandardModelObject(router: .getUserRepos(userName: "eren", queryList: ["page":1,"size":20]), objectType: [RepoModel].self)
        repoList$?.subscribe(onNext: { (value) in
            print(value)
        }).disposed(by: disposeBag)
    }
    
}
