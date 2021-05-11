//
//  ContentView.swift
//  SignUp
//
//  Created by Desiree on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    @State var parentButton = AvatarView(imageName: "parent", name: "parent", color: Color(#colorLiteral(red: 0.3940707199, green: 0.5039851328, blue: 0.2046320622, alpha: 1)))
    @State var childButton =  AvatarView(imageName: "child", name: "child", color: Color(#colorLiteral(red: 0.6707887158, green: 0.1774512484, blue: 0.237904652, alpha: 1)))
    @State var teacherButton = AvatarView(imageName: "teacher", name: "teacher", color: Color(#colorLiteral(red: 0, green: 0.5, blue: 0.5, alpha: 1)))
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

struct TextFieldView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State var showEmailRedBorder = false
    @State var showConfirmPasswordRedBorder = false
    @State var showPasswordRedBorder = false
    @State var passwordConfirmed = false
    
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
                        
                        if password == confirmPassword && email.isValidEmail && password.count == 6 {
                            print("confirmed")
                            signupDisabled = false
                        } else {
                            print("not confirmed")
                            signupDisabled = true
                        }
                        
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
                        showPasswordRedBorder = password.count == 6 ? false : true
                        
                        passwordConfirmed = password.count == 6 ? true : false
                       
                        if password == confirmPassword && email.isValidEmail && password.count == 6 {
                            print("confirmed")
                            signupDisabled = false
                        } else {
                            print("not confirmed")
                            signupDisabled = true
                        }
                        
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
                        if password == confirmPassword && email.isValidEmail && password.count == 6 {
                            print("confirmed")
                            signupDisabled = false
                        } else {
                            print("not confirmed")
                            signupDisabled = true
                        }
                     
                         
                        showConfirmPasswordRedBorder = confirmPassword != password ? true : false
                        
                    })
                    
                    .onChange(of: confirmPassword, perform: { value in
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
                        
                    })
                        .disabled(passwordConfirmed == false)
                        .padding()
                       
    
                }
//                .background(backgroundSettings.backgroundColor)
//                .cornerRadius(30)
//                .shadow(color: .gray, radius: 5)
                .overlay(showConfirmPasswordRedBorder ? RoundedRectangle(cornerRadius: 30).stroke(Color(.red), lineWidth: 1) : RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1))
                .modifier(TextFieldModifier())
            }
           
        }
        .frame(width: 350)
        
        
    }
}


struct TextFieldModifier: ViewModifier {
    @EnvironmentObject var backgroundSettings: BackgroundSettings
        func body(content: Content) -> some View {
        content
            .background(backgroundSettings.backgroundColor)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 5)
//            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1))
    }
    
    
}
struct TextFieldImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.leading, 30.0)
    }
}
                    

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BackgroundSettings())
    }
}

