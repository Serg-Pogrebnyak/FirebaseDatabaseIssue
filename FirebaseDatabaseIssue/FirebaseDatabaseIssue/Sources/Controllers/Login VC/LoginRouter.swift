//
//  LoginRouter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoginRouterInput {
    func routeToLoadingVC()
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

final class LoginRouter: BaseRouter, LoginRouterInput, LoginDataPassing {
    var dataStore: LoginDataStore?

    // MARK: Routing
    func routeToLoadingVC() {
        guard let viewController,
              let destinationVC = baseControllersFactory.instantiateLoadingVC()
        else { return }

        navigateToLoadingVC(sourceVC: viewController, destinationVC: destinationVC)
    }
    
    // MARK: Passing data
    
    // MARK: Navigation
    private func navigateToLoadingVC(sourceVC: UIViewController, destinationVC: UIViewController) {
        sourceVC.navigationController?.setViewControllers([destinationVC], animated: true)
    }
}
