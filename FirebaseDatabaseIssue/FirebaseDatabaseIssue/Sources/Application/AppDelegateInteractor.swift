//
//  AppDelegateInteractor.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

protocol AppDelegateBusinessLogic {
    func start(with request: AppDelegateUseCases.Start.Request)
}

final class AppDelegateInteractor: AppDelegateBusinessLogic {
    var presenter: AppDelegatePresentationLogic?
    
    init() {
        
    }

    // MARK: Do something
    func start(with request: AppDelegateUseCases.Start.Request) {
        presenter?.start(with: .init())
    }
}
