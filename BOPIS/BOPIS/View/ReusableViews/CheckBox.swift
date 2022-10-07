//
//  CheckBox.swift
//  BOPIS
//
//  Created by Ganesh Ubale on 06/10/22.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isChecked:Bool
    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            if isChecked {
                Image(systemName: "checkmark.square")
                    .resizable()
            } else {
                Image(systemName: "square")
                    .resizable()
            }
        }
        .frame(width: 30.0, height: 30.0)
        .foregroundColor(Color("ThemeColor"))
    }
}

struct CheckBox_Previews: PreviewProvider {    
    static var previews: some View {
        CheckBox(isChecked: .constant(true))
    }
}
