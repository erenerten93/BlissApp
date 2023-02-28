import UIKit


final class MainCoordinator: BaseCoordinator {
    
    private let navigationcontroller: UINavigationController
    
    init(navigationcontroller:UINavigationController) {
        self.navigationcontroller = navigationcontroller
    }
    
    override func start() {
        if let controller = self.mainController {
            self.navigationcontroller.setViewControllers([controller], animated: false)
        }
    }

    lazy var mainController: MainVC? = {
    
        let viewModel = MainViewModel()
        viewModel.coordinatorDelegate = self
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainVC
        controller?.viewModel = viewModel
        return controller
    }()

    lazy var avatarController: AvatarVC? = {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AvatarViewController") as? AvatarVC
        return controller
    }()
    
    lazy var reposViewController: ReposVC? = {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReposViewController") as? ReposVC
        controller?.viewModel = ReposViewModel()
        return controller
    }()
    
    lazy var emojiListViewController: EmojiVC? = {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmojiViewController") as? EmojiVC
        controller?.viewModel.emojiModelArray = mainController!.viewModel!.emojiViewModel  
        return controller
    }()
}

extension MainCoordinator: MainViewModelCoordinatorDelegate {
   
    func didTapAvatarList() {
        if let controller = self.avatarController {
            self.navigationcontroller.pushViewController(controller, animated: true)
        }
    }
    
    func didTapAppleRepos() {
        if let controller = self.reposViewController {
            self.navigationcontroller.pushViewController(controller, animated: true)
        }
    }
    func didTapEmojiList(){
        if let controller = self.emojiListViewController{
            self.navigationcontroller.pushViewController(controller, animated: true)
        }
        
    }
}
