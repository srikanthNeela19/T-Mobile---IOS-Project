//
//  LoginView.swift
//  BOPIS
//
//  Created by Ganesh Ubale on 06/10/22.
//

import SwiftUI

struct LoginView<ViewModel:ProtocolLoginViewModel>: View {
    @StateObject var viewModel:ViewModel
    @State var shouldShowPassword = true
    var body: some View {
        ScrollView {
            VStack{
                Image("T")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(40)
                    .padding(.all)
                Group {
                    Text("Welcome!")
                    Text("Please log in")
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                VStack {
                    Group {
                        TextField("Email, Phone Number", text: $viewModel.userEmailOrPhone)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        SecureTextField(shouldShowPassword: $shouldShowPassword, title: "Password", text: $viewModel.password)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                    
                    HStack {
                        Spacer()
                        CheckBox(isChecked: $shouldShowPassword)
                        Text("Show Password")
                    }
                    .padding(.all)
                    Button {
                        if viewModel.validateLogin() {
                            //API Call from viewModel and navigate accordingly
                            print("Login Success")
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Log in")
                                .font(.title2)
                            Spacer()
                        }
                    }
                    .padding(.all)
                    .background(Color("ThemeColor")) //Will add color from Common File
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    Group {
                        Button(action: {
                            print("Forgot")
                        }, label:{
                            Text("Forgot Password")
                        })
                        Button(action: {
                            print("Sign Up")
                        }, label:{
                            Text("Sign Up")
                        })
                    }
                    .foregroundColor(Color("ThemeColor")) //Will add color from Common File
                    .padding(.all)
                    Spacer()
                }
                .padding(.all)
            }
        }
        .alert(alertViewModel: viewModel.alertViewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
