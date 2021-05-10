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
//    @State var backgroundColor = Color(#colorLiteral(red: 0.101645493, green: 0.2374779485, blue: 0.3960759271, alpha: 0.8567087602))
    @State var signupDisabled = true
    var body: some View {
        
        ZStack {
            backgroundSettings.backgroundColor
                .ignoresSafeArea()
            
            VStack {
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
                    print("Hello")
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
    @Binding var signupDisabled: Bool
   
   
    
    var body: some View {
        VStack(spacing: -10) {
            ZStack(alignment:.leading) {
                   
                TextField("", text: $username)
                    .padding()
                    .textFieldStyle(CustomTextFieldStyle())
             
                   

                    if username.isEmpty {
                        HStack {
                        Image("user")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 30.0)
                        
                        Text("Username")
                            .foregroundColor(Color(#colorLiteral(red: 0.3242850006, green: 0.36008057, blue: 0.4058655798, alpha: 1)))
                        
                    }
                
                    }
            }
            
            ZStack(alignment:.leading) {
                   
                TextField("", text: $email, onEditingChanged: { _ in
                    print("hello")
                }, onCommit: {
                    print("hey girl")
                    if email.isValidEmail {
                        signupDisabled = false
                    }
                })
                    .padding()
                    .textFieldStyle(CustomTextFieldStyle())
             
               

                    if email.isEmpty {
                        HStack {
                            Image("envelope")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 30.0)
                            Text("Email")
                                .foregroundColor(Color(#colorLiteral(red: 0.3242850006, green: 0.36008057, blue: 0.4058655798, alpha: 1)))
                        
                    }
                }
               
            }
            
            ZStack(alignment:.leading) {
                   
                TextField("", text: $password, onEditingChanged: { _ in
                    print("password typing")
                }, onCommit: {
                    print("password complete")
                })
                    .padding()
                    .textFieldStyle(CustomTextFieldStyle())
             
                   
                
              

                    if password.isEmpty {
                        HStack {
                            Image("lock")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 30.0)
                        
                            Text("Password")
                                .foregroundColor(Color(#colorLiteral(red: 0.3242850006, green: 0.36008057, blue: 0.4058655798, alpha: 1)))
                        
                    }
                }
               
            }
            
            ZStack(alignment:.leading) {
                   
                TextField("", text: $confirmPassword, onEditingChanged: { _ in
                    print("typing confirm")
                }, onCommit: {
                    print("confirm complete")
                })
                    .padding()
                    .textFieldStyle(CustomTextFieldStyle())
             
                   
                
               

                    if confirmPassword.isEmpty {
                        HStack {
                            Image("lock")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 30.0)
                            Text("Confirm Password")
                                .foregroundColor(Color(#colorLiteral(red: 0.3242850006, green: 0.36008057, blue: 0.4058655798, alpha: 1)))
                        
                    }
                }
               
            }
            
        }

    }
}
struct CustomTextFieldStyle: TextFieldStyle {
    @EnvironmentObject var backgroundSettings: BackgroundSettings
    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                
                .padding(15)
                .background(backgroundSettings.backgroundColor)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 5)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1))
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

