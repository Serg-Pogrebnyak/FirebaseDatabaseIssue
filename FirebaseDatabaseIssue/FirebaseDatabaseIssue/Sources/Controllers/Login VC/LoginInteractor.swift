//
//  LoginInteractor.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func viewDidLoad(with request: LoginUseCases.ViewDidLoad.Request)
}

protocol LoginDataStore {
    
}

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    
    init() {
        
    }

    // MARK: Do something
    func viewDidLoad(with request: LoginUseCases.ViewDidLoad.Request) {
        presenter?.viewDidLoad(with: .init())
    }
}
