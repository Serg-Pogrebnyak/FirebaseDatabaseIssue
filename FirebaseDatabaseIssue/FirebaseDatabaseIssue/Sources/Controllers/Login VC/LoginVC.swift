//
//  LoginVC.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    func viewDidLoad(with viewModel: LoginUseCases.ViewDidLoad.ViewModel)
}

final class LoginVC: UIViewController {
    
    private enum TextFieldFlow: Int {
        case email
        case password
    }
    
    // MARK: Outlets
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var contentScrollViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var textFieldsArray: [UITextField]!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var forgotPasswordButton: UIButton!
    
    // MARK: Variables
    var interactor: LoginBusinessLogic?
    var routerInput: LoginRouterInput?
    var routerDataPassing: LoginDataPassing?
    var textFieldDesignFactory: TextFieldDesignFactoryProtocol?
    
    // MARK: VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.viewDidLoad(with: .init())
    }
    
    // MARK: - Private functions
    // MARK: Actions
    @IBAction private func didTapBackgroundView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction private func didTapLoginButton(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction private func didTapRegisterButton(_ sender: Any) {
    }
    
    @IBAction private func didTapForgotPasswordButton(_ sender: Any) {
    }
    
    // MARK: UI
    private func setupUI() {
        textFieldDesignFactory?.designLoginOrRegisterEmailTextField(textFieldContainer(for: .email))
        textFieldDesignFactory?.designLoginPasswordTextField(textFieldContainer(for: .password))
        textFieldsArray.forEach { $0.delegate = self }
        textFieldContainer(for: .email).text = "test@test.com"
        textFieldContainer(for: .password).text = "test"
    }
    
    // MARK: Other
    private func textFieldContainer(for flow: TextFieldFlow) -> UITextField {
        textFieldsArray[flow.rawValue]
    }
}

// MARK: - LoginDisplayLogic Extension
extension LoginVC: LoginDisplayLogic {
    func viewDidLoad(with viewModel: LoginUseCases.ViewDidLoad.ViewModel) {
        title = viewModel.title
        loginButton.setTitle(viewModel.loginButtonTitle, for: .normal)
        registerButton.setTitle(viewModel.registerButtonTitle, for: .normal)
        forgotPasswordButton.setTitle(viewModel.forgotPasswordButtonTitle, for: .normal)
    }
}

// MARK: - UITextFieldDelegate Extension
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
