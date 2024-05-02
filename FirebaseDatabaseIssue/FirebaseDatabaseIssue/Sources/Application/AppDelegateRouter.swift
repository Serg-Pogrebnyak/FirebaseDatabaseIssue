//
//  AppDelegateRouter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

protocol AppDelegateRouterInput {
    func routeToLoadingVC()
}

final class AppDelegateRouter: AppDelegateRouterInput {
    private let window: UIWindow
    private let baseControllersFactory: BaseControllersFactory
    
    init(window: UIWindow, baseControllersFactory: BaseControllersFactory) {
        self.window = window
        self.baseControllersFactory = baseControllersFactory
    }

    // MARK: Routing
    func routeToLoadingVC() {
        guard let destinationVC = baseControllersFactory.instantiateLoadingVC() else { return }

        navigateToLoadingVC(destinationVC: destinationVC)
    }
    
    // MARK: Passing data
    
    // MARK: Navigation
    private func navigateToLoadingVC(destinationVC: UIViewController) {
        let navigationController = UINavigationController(rootViewController: destinationVC)
        window.rootViewController = navigationController
    }
}
