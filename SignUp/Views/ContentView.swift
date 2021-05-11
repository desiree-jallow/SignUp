//
//  ContentView.swift
//  SignUp
//
//  Created by Desiree on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var backgroundSettings = BackgroundSettings()
    @State var signupDisabled = true
    
    var body: some View {
        
        ZStack {
            backgroundSettings.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text("WHO ARE YOU?")
                    .bold()
                
                AvatarStackView()
                
                
                TextFieldView(signupDisabled: $signupDisabled)
                
                
                
                Button(action: {
                    print("Sign up Confirmed")
                }, label: {
                    Text("Sign Up")
                        .bold()
                        .font(.title)
                        .padding(.horizontal, 100)
                        .padding(5)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                        
                        .cornerRadius(30)
                    
                    
                }).disabled(signupDisabled)
                
                HStack {
                    Text("Already have an account.")
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Log in here")
                        .bold()
                    
                }
            }
            
        }
        .environmentObject(backgroundSettings)
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BackgroundSettings())
    }
}

