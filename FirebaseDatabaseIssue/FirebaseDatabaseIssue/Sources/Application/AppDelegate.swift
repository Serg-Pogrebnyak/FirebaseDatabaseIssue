//
//  AppDelegate.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

protocol AppDelegateDisplayLogic: AnyObject {
    func start(with viewModel: AppDelegateUseCases.Start.ViewModel)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var interactor: AppDelegateBusinessLogic?
    private var routerInput: AppDelegateRouterInput?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()
        let database = Database.database()
        database.callbackQueue = DispatchQueue(label: "remote.db.queue")
        let _ = database.reference()
        let appInstanceTuple = BaseDependencyContainer.standard.instantiateApp(with: self, and: window)
        interactor = appInstanceTuple.interactor
        routerInput = appInstanceTuple.router
        self.window = window
        interactor?.start(with: .init())
        return true
    }
}

// MARK: - AppDelegateDisplayLogic Extension
extension AppDelegate: AppDelegateDisplayLogic {
    func start(with viewModel: AppDelegateUseCases.Start.ViewModel) {
        routerInput?.routeToLoadingVC()
    }
}

// MARK: - BaseDependencyContainer Fileprivate Extension
fileprivate extension BaseDependencyContainer {
    func instantiateApp(with appDisplayLogicDelegate: AppDelegateDisplayLogic, and window: UIWindow) -> (interactor: AppDelegateBusinessLogic, router: AppDelegateRouterInput) {
        let interactor = AppDelegateInteractor()
        let presenter = AppDelegatePresenter()
        let router = AppDelegateRouter(window: window,
                                       baseControllersFactory: self)
        interactor.presenter = presenter
        presenter.displayLogic = appDisplayLogicDelegate
        return (interactor, router)
    }
}
