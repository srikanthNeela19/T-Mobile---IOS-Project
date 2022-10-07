//
//  SplashView.swift
//  BOPIS
//
//  Created by GlobalLogic on 04/10/22.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                LoginView()
            } else {
                Image("BOPIS-portait")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = true
                }
            }
            
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
