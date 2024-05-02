//
//  TextFieldDesignFactory.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

protocol TextFieldDesignFactoryProtocol {
    func designLoginOrRegisterEmailTextField(_ textField: UITextField)
    func designLoginPasswordTextField(_ textField: UITextField)
}

struct TextFieldDesignFactory {
    
}

// MARK: - TextFieldDesignFactoryProtocol Extension
extension TextFieldDesignFactory: TextFieldDesignFactoryProtocol {
    func designLoginOrRegisterEmailTextField(_ textField: UITextField) {
        commonDesignEmailTextField(textField)
        textField.returnKeyType = .next
    }
    
    func designLoginPasswordTextField(_ textField: UITextField) {
        commonDesignPasswordTextField(textField)
        textField.placeholder = ""//R.string.localizable.textFieldDesignFactoryPasswordPlaceholder()
        textField.returnKeyType = .done
    }
    
    // MARK: - Private stuff
    private func commonDesignEmailTextField(_ textField: UITextField) {
        textField.placeholder = ""//R.string.localizable.textFieldDesignFactoryEmailPlaceholder()
        textField.keyboardType = .emailAddress
    }
    
    private func commonDesignPasswordTextField(_ textField: UITextField) {
        textField.isSecureTextEntry = true
    }
}
