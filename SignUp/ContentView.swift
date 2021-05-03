//
//  ContentView.swift
//  SignUp
//
//  Created by Desiree on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.101645493, green: 0.2374779485, blue: 0.3960759271, alpha: 1))
                .ignoresSafeArea()
            VStack {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
               
                Text("WHO ARE YOU?")
                    .foregroundColor(.blue)
                HStack {
                    AvatarView(imageName: "parent", name: "parent", color: .green)
                    AvatarView(imageName: "child", name: "child", color: .orange)
                    AvatarView(imageName: "teacher", name: "teacher", color: .red)
                }
                .frame(width: 300, height: 110)
                
            }
            
           
        }
       
    }
   
}

struct AvatarView: View {
    var imageName: String
    var name: String
    var color: Color
    
    var body: some View {
        
            VStack {
                Image(imageName)
                    .resizable()
                Text(name.uppercased())
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
