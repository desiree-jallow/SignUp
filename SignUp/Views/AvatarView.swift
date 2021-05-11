//
//  AvatarView.swift
//  SignUp
//
//  Created by Desiree on 5/11/21.
//

import SwiftUI

struct AvatarView: View {
    var imageName: String
    var name: String
    var color: Color
    var isSelected: Bool = true
    
    var body: some View {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                  
                Text(name.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
            }
         
        }
    }


