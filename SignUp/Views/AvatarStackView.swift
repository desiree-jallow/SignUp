//
//  AvatarStackView.swift
//  SignUp
//
//  Created by Desiree on 5/11/21.
//

import SwiftUI

struct AvatarStackView: View {
    @State var parentButton = AvatarView(imageName: "parent", name: "parent", color: Color(#colorLiteral(red: 0.3940707199, green: 0.5039851328, blue: 0.2046320622, alpha: 1)))
    @State var childButton =  AvatarView(imageName: "child", name: "child", color: Color(#colorLiteral(red: 0.6707887158, green: 0.1774512484, blue: 0.237904652, alpha: 1)))
    @State var teacherButton = AvatarView(imageName: "teacher", name: "teacher", color: Color(#colorLiteral(red: 0, green: 0.5, blue: 0.5, alpha: 1)))
    @EnvironmentObject var backgroundSettings: BackgroundSettings
    var body: some View {
        
        HStack {
            parentButton
                .opacity(parentButton.isSelected ? 1 : 0.1)
                .onTapGesture {
                    parentButton.isSelected = true
                    backgroundSettings.backgroundColor = parentButton.color.opacity(0.7)
                    childButton.isSelected = false
                    teacherButton.isSelected = false
                    
                }
            childButton
                .opacity(childButton.isSelected ? 1 : 0.1)
                .onTapGesture {
                    childButton.isSelected = true
                    backgroundSettings.backgroundColor = childButton.color.opacity(0.7)
                    parentButton.isSelected = false
                    teacherButton.isSelected = false
                }
            teacherButton
                .opacity(teacherButton.isSelected ? 1 : 0.1)
                .onTapGesture {
                    teacherButton.isSelected = true
                    backgroundSettings.backgroundColor = teacherButton.color.opacity(0.7)
                    parentButton.isSelected = false
                    childButton.isSelected = false
                }
        }
    }
}

struct AvatarStackView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarStackView()
    }
}
