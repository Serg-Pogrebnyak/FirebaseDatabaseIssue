//
//  AppDelegatePresenter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

protocol AppDelegatePresentationLogic {
    func start(with response: AppDelegateUseCases.Start.Response)
}

final class AppDelegatePresenter: AppDelegatePresentationLogic {
    weak var displayLogic: AppDelegateDisplayLogic?

    func start(with response: AppDelegateUseCases.Start.Response) {
        displayLogic?.start(with: .init())
    }
}
