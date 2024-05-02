//
//  LoadingInteractor.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoadingBusinessLogic {
    func viewDidLoad(with request: LoadingUseCases.ViewDidLoad.Request)
    func checkIsUserAuthorized(with request: LoadingUseCases.CheckIsUserAuthorized.Request)
}

protocol LoadingDataStore {
    
}

final class LoadingInteractor: LoadingBusinessLogic, LoadingDataStore {
    var presenter: LoadingPresentationLogic?
    
    init() {
        
    }

    // MARK: Do something
    func viewDidLoad(with request: LoadingUseCases.ViewDidLoad.Request) {
        presenter?.viewDidLoad(with: .init())
    }
    
    func checkIsUserAuthorized(with request: LoadingUseCases.CheckIsUserAuthorized.Request) {
        presenter?.checkIsUserAuthorized(with: .init(status: .userDoesNotAuthorized))
    }
}
