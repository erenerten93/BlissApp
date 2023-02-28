//
//  Coordinator.swift
//  BlissApp
//
//  Created by Eren Erten on 23.02.2023.
//

import Foundation

protocol Coordinator : AnyObject {
  var childCoordinators: [Coordinator] { get set }
  func start()
}
/**
 We can store new coordinators to our stack and remove those one when the flow has been completed
 (i.e.: user navigated back, view has been dismissed, etc).
 */
extension Coordinator {
    
  func store(coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }
  
  func free(coordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== coordinator }
  }
}
