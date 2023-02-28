//
//  AppCoordinator.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import UIKit

class AppCoordinator: BaseCoordinator {
  
  
  // MARK: - Properties
  let window: UIWindow?
  
  lazy var rootViewController: UINavigationController = {
    return UINavigationController()
  }()
    
  //  the AppCoordinator it must own the window.
  init(window: UIWindow?) {
    self.window = window
  }
  
  override func start() {
    guard let window = window else { return }
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
    loginFlow()
  }
  
  private func loginFlow() {
    let mainCoordinator = MainCoordinator(navigationcontroller: self.rootViewController)
    store(coordinator: mainCoordinator)
    mainCoordinator.start()
  }
}
