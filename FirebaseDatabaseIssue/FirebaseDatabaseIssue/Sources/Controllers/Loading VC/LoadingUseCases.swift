//
//  LoadingUseCases.swift
//  FirebaseDatabaseIssue
//
//  Created by Serhii on 02.05.2024.
//  Copyright (c) 2024 Serhii. All rights reserved.
//

import UIKit

enum LoadingUseCases {
    // MARK: - Use Cases
    enum ViewDidLoad {
        struct Request {

        }
        
        struct Response {
            
        }

        struct ViewModel {
            let loadingState: String
        }
    }
    
    enum CheckIsUserAuthorized {
        struct Request {

        }
        
        enum Status {
            case userDoesNotAuthorized
        }

        struct Response {
            let status: Status
        }

        struct ViewModel {
            let status: Status
        }
    }
}
