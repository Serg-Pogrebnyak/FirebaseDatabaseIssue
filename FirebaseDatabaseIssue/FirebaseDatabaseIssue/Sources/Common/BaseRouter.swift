//
//  BaseRouter.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//

import UIKit

class BaseRouter: NSObject {
    private(set) weak var viewController: UIViewController?
    let baseControllersFactory: BaseControllersFactory
    
    init(vc: UIViewController, baseControllersFactory: BaseControllersFactory) {
        viewController = vc
        self.baseControllersFactory = baseControllersFactory
    }
}
