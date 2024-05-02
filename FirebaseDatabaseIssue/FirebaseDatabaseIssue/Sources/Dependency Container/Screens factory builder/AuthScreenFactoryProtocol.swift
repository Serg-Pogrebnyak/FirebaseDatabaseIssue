//
//  AuthScreenFactoryProtocol.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

protocol AuthScreenFactoryProtocol {
    func instantiateLoginVC() -> LoginVC?
}

extension BaseDependencyContainer: AuthScreenFactoryProtocol {
    func instantiateLoginVC() -> LoginVC? {
        guard let viewController = R.storyboard.auth.loginVC() else { return nil }
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(vc: viewController,
                                 baseControllersFactory: self)
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.routerInput = router
        viewController.routerDataPassing = router
        viewController.textFieldDesignFactory = textFieldDesignFactory
        return viewController
    }
}
