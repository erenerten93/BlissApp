//
//  ReposVC.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import UIKit
import RxSwift

class ReposVC: UIViewController {
    
    @IBOutlet weak var repoTableView: UITableView!
    var viewModel:ReposViewModel!
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchRepoList()
        bindUI()
    }
    func bindUI(){
        
        repoTableView.rx.didScroll.subscribe { [weak self] _ in
                  guard let self = self else { return }
                  let offSetY = self.repoTableView.contentOffset.y
                  let contentHeight = self.repoTableView.contentSize.height

                  if offSetY > (contentHeight - self.repoTableView.frame.size.height - 100) {
                      if(self.viewModel.newDataCame){
                          self.viewModel?.fetchRepoList()
                      }
                  }
              }
              .disposed(by: disposeBag)
        
        viewModel.repoList$?.bind(to: repoTableView.rx.items(cellIdentifier: "RepoTableViewCell", cellType: RepoTableViewCell.self)) { row,model,cell in
            cell.configureCell(repo:model)
        }.disposed(by: disposeBag)
    }
    
    
    deinit {
      print(#function , NSStringFromClass(ReposVC.self))
    }

}
