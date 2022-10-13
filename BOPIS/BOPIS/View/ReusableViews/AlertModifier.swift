//
//  AlertModifier.swift
//  BOPIS
//
//  Created by Ganesh Ubale on 13/10/22.
//

import SwiftUI
struct AlertModifier<T:ProtocolAlertViewModel>: ViewModifier {
    @ObservedObject var alertViewModel: T
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.alert(self.alertViewModel.messageTitle, isPresented: self.$alertViewModel.showMessage, presenting: alertViewModel) { alertViewModel in
                Button(role: .cancel) {
                } label: {
                    Text("Ok")
                }
            } message: { alertViewModel in
                Text(alertViewModel.messageText)
            }
        } else {
            content.alert(isPresented: self.$alertViewModel.showMessage) {
                Alert(title: Text(self.alertViewModel.messageTitle), message: Text(self.alertViewModel.messageText), dismissButton: .default(Text("Okay")))
            }
        }
    }
}

extension View {
    func alert<T:ProtocolAlertViewModel>(alertViewModel: T) -> some View {
        modifier(BOPIS.AlertModifier(alertViewModel:alertViewModel))
    }
}
