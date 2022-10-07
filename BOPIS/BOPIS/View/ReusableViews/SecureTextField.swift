//
//  SecureTextField.swift
//  BOPIS
//
//  Created by Ganesh Ubale on 06/10/22.
//

import SwiftUI

struct SecureTextField: View {
    @Binding var shouldShowPassword:Bool
    @State var title: String
    @Binding var text:String
    var body: some View {
        if shouldShowPassword {
            TextField(title, text: $text)
        } else {
            SecureField(title, text: $text)
        }
    }
}

struct SecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextField(shouldShowPassword: .constant(true), title: "", text: .constant("ABC"))
    }
}
