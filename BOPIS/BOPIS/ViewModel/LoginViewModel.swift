//
//  LoginViewModel.swift
//  BOPIS
//
//  Created by GlobalLogic on 04/10/22.
//

import Foundation
struct ErrorDetails: Identifiable {
    let id = UUID()
    let name: String = "Error"
    let error: String
}

protocol ProtocalLoginViewModel:ObservableObject {
    var userEmailOrPhone: String { get set }
    var password: String { get set }
    var errorDetails: ErrorDetails? { get }
    func validateLogin() -> Bool
}

class LoginViewModel:ProtocalLoginViewModel {
    @Published var userEmailOrPhone: String = emptyString
    @Published var password: String = emptyString
    var errorDetails: ErrorDetails?

    func validateLogin() -> Bool {
        if userEmailOrPhone.isEmpty || password.isEmpty {
            errorDetails = ErrorDetails(error: "Please enter Email/Phone and Password")
            return false
        }
        return true
    }
}
