//
//  LoadingPresenter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoadingPresentationLogic {
    func viewDidLoad(with response: LoadingUseCases.ViewDidLoad.Response)
    func checkIsUserAuthorized(with response: LoadingUseCases.CheckIsUserAuthorized.Response)
}

final class LoadingPresenter: LoadingPresentationLogic {
    weak var viewController: LoadingDisplayLogic?

    func viewDidLoad(with response: LoadingUseCases.ViewDidLoad.Response) {
//        R.string.localizable.loadingVCLoading()
        viewController?.viewDidLoad(with: .init(loadingState: ""))
    }
    
    func checkIsUserAuthorized(with response: LoadingUseCases.CheckIsUserAuthorized.Response) {
        viewController?.checkIsUserAuthorized(with: .init(status: response.status))
    }
}
