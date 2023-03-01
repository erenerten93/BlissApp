//
//  MainVC.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import UIKit
import RxSwift
import RxRelay

class MainVC: UIViewController {
    
    var disposeBag = DisposeBag()
    
    var viewModel : MainViewModel?    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var randomEmojiImage: UIImageView!
    
    @IBOutlet weak var randomEmojiButton: UIButton!
    @IBOutlet weak var emojisListButton: UIButton!
    @IBOutlet weak var avatarsListButton: UIButton!
    @IBOutlet weak var appleReposButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindObservers()
        prepareUI()
    }
    
    @IBAction func didTapRandomEmojiButton(_ sender: UIButton) {
        self.viewModel?.onTapRandomEmoji()
    }
    
    @IBAction func didTapSearchButton(_ sender: Any) {
        self.viewModel?.onTapSearchButton(userName: searchTextField.text ?? "blissapps")
    }
    
    @IBAction func didTapEmojisListButton(_ sender: UIButton) {
        self.viewModel?.onTapEmojiList()
    }
    @IBAction func didTapReposListButton(_ sender: UIButton) {
        self.viewModel?.onTapAppleRepos()
    }
    
    @IBAction func didTapAvatarListsButton(_ sender: UIButton) {
        self.viewModel?.onTapAvatarLists()
    }
    
    deinit {
        print(#function , NSStringFromClass(MainVC.self))
    }
    
    func prepareUI(){
        prepareButton(buttonToPrepare: randomEmojiButton,title: "Random Emoji")
        prepareButton(buttonToPrepare: emojisListButton,title: "Emojis List")
        prepareButton(buttonToPrepare: avatarsListButton,title: "Avatar List")
        prepareButton(buttonToPrepare: appleReposButton,title: "Git Repos")
        prepareButton(buttonToPrepare: searchButton, title: "Search")
    }
    
    func prepareButton(buttonToPrepare:UIButton, title : String){
        buttonToPrepare.setTitle(title, for: .normal)
        buttonToPrepare.layer.cornerRadius = 15
        buttonToPrepare.setTitleColor(.blue, for: .normal)
        buttonToPrepare.backgroundColor = .lightGray
    }
    
    func bindObservers(){
        viewModel?.searchedAvatar$.filter({ (value) in
            return !(value.avatarURL?.isEmpty ?? true)
            }).subscribe(onNext: { (value) in
            DispatchQueue.main.async {
                self.randomEmojiImage.setImageFromStringrURL(stringUrl: value.avatarURL ?? "blissapp")
            }
        }).disposed(by: disposeBag)
        
        viewModel?.emojiURL.subscribe(onNext: { (value) in
            DispatchQueue.main.async {
                self.randomEmojiImage.setImageFromStringrURL(stringUrl: value)
            }
        }).disposed(by: disposeBag)
    }
    
}
