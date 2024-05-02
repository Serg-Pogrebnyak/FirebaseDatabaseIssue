//
//  LoadingVC.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoadingDisplayLogic: AnyObject {
    func viewDidLoad(with viewModel: LoadingUseCases.ViewDidLoad.ViewModel)
    func checkIsUserAuthorized(with viewModel: LoadingUseCases.CheckIsUserAuthorized.ViewModel)
}

final class LoadingVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var statusLabel: UILabel!
    
    // MARK: Variables
    var interactor: LoadingBusinessLogic?
    var routerInput: LoadingRouterInput?
    var routerDataPassing: LoadingDataPassing?
    
    // MARK: VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.viewDidLoad(with: .init())
    }

    // MARK: - Private functions
    // MARK: UI
    private func setupUI() {
        
    }
}

// MARK: - LoadingDisplayLogic
extension LoadingVC: LoadingDisplayLogic {
    func viewDidLoad(with viewModel: LoadingUseCases.ViewDidLoad.ViewModel) {
        statusLabel.text = viewModel.loadingState
        interactor?.checkIsUserAuthorized(with: .init())
    }
    
    func checkIsUserAuthorized(with viewModel: LoadingUseCases.CheckIsUserAuthorized.ViewModel) {
        switch viewModel.status {
        case .userDoesNotAuthorized:
            routerInput?.routeToLoginVC()
        }
    }
}
