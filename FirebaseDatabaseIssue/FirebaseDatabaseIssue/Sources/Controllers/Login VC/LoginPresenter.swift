//
//  LoginPresenter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func viewDidLoad(with response: LoginUseCases.ViewDidLoad.Response)
}

final class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?

    func viewDidLoad(with response: LoginUseCases.ViewDidLoad.Response) {
        let title = R.string.localizable.loginVCTitle()
        let loginButtonTitle = R.string.localizable.loginVCLoginButtonTitle()
        let registerButtonTitle = R.string.localizable.loginVCRegisterButtonTitle()
        let forgotPasswordButtonTitle = R.string.localizable.loginVCForgotPasswordButtonTitle()
        viewController?.viewDidLoad(with: .init(title: title,
                                                loginButtonTitle: loginButtonTitle,
                                                registerButtonTitle: registerButtonTitle,
                                                forgotPasswordButtonTitle: forgotPasswordButtonTitle))
    }
}
