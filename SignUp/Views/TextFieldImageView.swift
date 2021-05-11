//
//  TextFieldImageView.swift
//  SignUp
//
//  Created by Desiree on 5/11/21.
//

import SwiftUI

struct TextFieldImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.leading, 30.0)
    }
}
