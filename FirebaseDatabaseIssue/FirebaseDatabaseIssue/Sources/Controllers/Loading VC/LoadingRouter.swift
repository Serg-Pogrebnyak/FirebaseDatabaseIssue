//
//  LoadingRouter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoadingRouterInput {
    func routeToLoginVC()
}

protocol LoadingDataPassing {
    var dataStore: LoadingDataStore? { get }
}

final class LoadingRouter: BaseRouter, LoadingRouterInput, LoadingDataPassing {
    var dataStore: LoadingDataStore?
    
    // MARK: Routing
    func routeToLoginVC() {
        guard let viewController,
              let destinationVC = baseControllersFactory.instantiateLoginVC()
        else { return }
        
        navigateToLoginVC(sourceVC: viewController, destinationVC: destinationVC)
    }
    
    // MARK: Passing data
    
    // MARK: Navigation
    private func navigateToLoginVC(sourceVC: UIViewController, destinationVC: UIViewController) {
        sourceVC.navigationController?.setViewControllers([destinationVC], animated: true)
    }
}
