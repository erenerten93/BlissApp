//
//  MainVC.swift
//  BlissApp
//
//  Created by Eren Erten on 17.02.2023.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa



class EmojiVC: UIViewController {
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var emojiCollectionView: UICollectionView!
    
    var viewModel: EmojiViewModel = EmojiViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    func bindUI(){
        viewModel.emojiModelArray$.bind(to: emojiCollectionView.rx.items(cellIdentifier: "EmojiCollectionViewCell", cellType: EmojiCollectionViewCell.self)) { row,model,cell in
            cell.configureCell(emoji: model)
        }.disposed(by: disposeBag)
    }
    
    func errorAlert(){
        let alert = UIAlertController(title: "Error", message: "Check your internet connection and TRY Again!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
        
    }
    
    
    deinit {
      print(#function , NSStringFromClass(EmojiVC.self))
    }
    
  
}


