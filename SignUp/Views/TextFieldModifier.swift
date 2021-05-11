//
//  TextFieldModifier.swift
//  SignUp
//
//  Created by Desiree on 5/11/21.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    @EnvironmentObject var backgroundSettings: BackgroundSettings
        func body(content: Content) -> some View {
        content
            .background(backgroundSettings.backgroundColor)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 5)

    }
    
}

