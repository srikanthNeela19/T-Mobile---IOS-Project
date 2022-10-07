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
                VStack{
                    Image("TMobile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                    Text("BOPIS")
                        .font(.largeTitle)
                }
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
