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
            AvatarView()
        }
        
       
    }
   
}

struct AvatarView: View {
    var body: some View {
        HStack {
            VStack {
                Image("parent")
                    .resizable()
                Text("PARENT")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            VStack {
                Image("child")
                    .resizable()
                Text("CHILD")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
           
            VStack {
                Image("teacher")
                    .resizable()
                Text("TEACHER")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
           
           
        }
        .frame(width: 300, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
