//
//  LoadingScreenFactoryProtocol.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

protocol LoadingScreenFactoryProtocol {
    func instantiateLoadingVC() -> LoadingVC?
}

extension BaseDependencyContainer: LoadingScreenFactoryProtocol {
    func instantiateLoadingVC() -> LoadingVC? {
        guard let viewController = R.storyboard.loading.loadingVC() else { return nil }

        let interactor = LoadingInteractor()
        let presenter = LoadingPresenter()
        let router = LoadingRouter(vc: viewController,
                                   baseControllersFactory: self)
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.routerInput = router
        viewController.routerDataPassing = router
        return viewController
    }
}
