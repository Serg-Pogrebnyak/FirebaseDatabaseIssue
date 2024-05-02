//
//  BaseDependencyContainer.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import Foundation

typealias BaseControllersFactory = LoadingScreenFactoryProtocol & AuthScreenFactoryProtocol

class BaseDependencyContainer {
    
}

extension BaseDependencyContainer {
    var textFieldDesignFactory: TextFieldDesignFactoryProtocol { TextFieldDesignFactory() }
}

// MARK: - BaseDependencyContainer Extension
extension BaseDependencyContainer {
    static var standard: BaseDependencyContainer {
        .init()
    }
}

