//
//  TextFieldView.swift
//  SignUp
//
//  Created by Desiree on 5/11/21.
//

import SwiftUI

struct TextFieldView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State var showEmailRedBorder = false
    @State var showConfirmPasswordRedBorder = false
    @State var showPasswordRedBorder = false
    
    
    @Binding var signupDisabled: Bool
    
    @EnvironmentObject var backgroundSettings: BackgroundSettings
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            ZStack(alignment:.leading) {
                HStack {
                    TextFieldImageView(imageName: "user")
                    
                    TextField("Username", text: $username)
                        .padding()
                    
                }
                .modifier(TextFieldModifier())
                
            }
            
            
            ZStack(alignment:.leading) {
                HStack {
                    TextFieldImageView(imageName: "envelope")
                    
                    TextField("Email", text: $email, onCommit: {
                        showEmailRedBorder = email.isValidEmail ? false : true
                        
                        validateAllFields()
                        
                    })
                    .padding()
                    
                }
                .overlay(showEmailRedBorder ? RoundedRectangle(cornerRadius: 30).stroke(Color(.red), lineWidth: 1) : RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1))
                .modifier(TextFieldModifier())
            }
            
            ZStack(alignment:.leading) {
                HStack {
                    TextFieldImageView(imageName: "lock")
                    
                    TextField("Password", text: $password, onCommit: {
                        showPasswordRedBorder = password.count >= 6 ? false : true
                        
                        validateAllFields()
                        
                    })
                    
                    .padding()
                    
                }
                .overlay(showPasswordRedBorder ? RoundedRectangle(cornerRadius: 30).stroke(Color(.red), lineWidth: 1) : RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1))
                .modifier(TextFieldModifier())
            }
            
            ZStack(alignment:.leading) {
                HStack {
                    TextFieldImageView(imageName: "lock")
                    
                    TextField("Confirm Password", text: $confirmPassword, onCommit: {
                        
                        validateAllFields()
                        
                        showConfirmPasswordRedBorder = confirmPassword != password ? true : false
                        
                    })
                    
                    .onChange(of: confirmPassword, perform: { value in
                        
                        validateConfirmedPasswordField(value: value)
                        
                    })
                    .disabled(showPasswordRedBorder)
                    .padding()
                    
                    
                }
                
                .overlay(showConfirmPasswordRedBorder ? RoundedRectangle(cornerRadius: 30).stroke(Color(.red), lineWidth: 1) : RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1))
                .modifier(TextFieldModifier())
            }
            
        }
        .frame(width: 350)
        
        
    }
    
    
    private func validateAllFields() {
        if password == confirmPassword && email.isValidEmail && password.count >= 6 {
            print("confirmed")
            signupDisabled = false
        } else {
            print("not confirmed")
            signupDisabled = true
        }
        
    }
    
    private func validateConfirmedPasswordField(value: String) {
        
        let range = confirmPassword.startIndex..<confirmPassword.endIndex
        if confirmPassword.count <= password.count {
            if value != password[range] {
                showConfirmPasswordRedBorder = true
            } else {
                showConfirmPasswordRedBorder = false
            }
        } else {
            showConfirmPasswordRedBorder = true
        }
    }
}


