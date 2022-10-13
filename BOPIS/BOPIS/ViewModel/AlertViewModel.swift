//
//  AlertViewModel.swift
//  BOPIS
//
//  Created by Ganesh Ubale on 13/10/22.
//

import Foundation

protocol ProtocolAlertViewModel:ObservableObject {
    var showMessage: Bool { get set }
    var messageTitle : String { get }
    var messageText : String { get }
    func showMessage(title: String, text: String)
}

class AlertViewModel :ProtocolAlertViewModel  {
    @Published var showMessage: Bool = false
    var messageTitle : String = ""
    var messageText : String = ""

    func showMessage(title: String, text: String) {
       self.messageTitle = title
       self.messageText = text
       self.showMessage = true
    }
}
