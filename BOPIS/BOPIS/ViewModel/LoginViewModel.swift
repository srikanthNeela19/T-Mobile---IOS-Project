//
//  LoginViewModel.swift
//  BOPIS
//
//  Created by GlobalLogic on 04/10/22.
//

import Foundation

protocol ProtocolLoginViewModel:ObservableObject {
    associatedtype T:ProtocolAlertViewModel
    var userEmailOrPhone: String { get set }
    var password: String { get set }
    var alertViewModel:T { get }
    
    func validateLogin() -> Bool
    func signIn() -> Bool
}

class LoginViewModel<T:ProtocolAlertViewModel>:ProtocolLoginViewModel {
    @Published var userEmailOrPhone: String = emptyString
    @Published var password: String = emptyString
    var alertViewModel: T
    
    init(alertViewModel: T = AlertViewModel()) {
        self.alertViewModel = alertViewModel
    }

    func validateLogin() -> Bool {
        // Parform all validations here and pass messages accodingly
        if userEmailOrPhone.isEmpty || password.isEmpty {
            alertViewModel.showMessage(title: "Invalid Data", text: "Please fill all fields!")
            return false
        }
        return true
    }
    
    func signIn() -> Bool {
        return true
    }
}
