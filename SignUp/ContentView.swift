//
//  ContentView.swift
//  SignUp
//
//  Created by Desiree on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    @State var parentButton = AvatarView(imageName: "parent", name: "parent", color: .yellow)
    @State var childButton =  AvatarView(imageName: "child", name: "child", color: .orange)
    @State var teacherButton = AvatarView(imageName: "teacher", name: "teacher", color: .blue)
    @State var backgroundColor = Color(#colorLiteral(red: 0.101645493, green: 0.2374779485, blue: 0.3960759271, alpha: 0.8567087602))
    @State var signupDisabled = true
    var body: some View {
        
        ZStack {
            backgroundColor
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
                            backgroundColor = parentButton.color.opacity(0.5)
                            childButton.isSelected = false
                            teacherButton.isSelected = false
                            
                        }
                    childButton
                        .opacity(childButton.isSelected ? 1 : 0.1)
                        .onTapGesture {
                            childButton.isSelected = true
                            backgroundColor = childButton.color.opacity(0.5)
                            parentButton.isSelected = false
                            teacherButton.isSelected = false
                        }
                    teacherButton
                        .opacity(teacherButton.isSelected ? 1 : 0.1)
                        .onTapGesture {
                            teacherButton.isSelected = true
                            backgroundColor = teacherButton.color.opacity(0.5)
                            parentButton.isSelected = false
                            childButton.isSelected = false
//                    AvatarView(imageName: "parent", name: "parent", color: .green)
//                        .opacity(isSelected ? 0.8 : 0.1)
//                        .onTapGesture {
//                            isSelected = true
//
//                        }
                    
//                    AvatarView(imageName: "child", name: "child", color: .orange)
//                    AvatarView(imageName: "teacher", name: "teacher", color: .red)
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
                        .foregroundColor(Color(#colorLiteral(red: 0.2492679467, green: 0.5971605092, blue: 1, alpha: 0.5)))
                        
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
                                .foregroundColor(Color(#colorLiteral(red: 0.2492679467, green: 0.5971605092, blue: 1, alpha: 0.5)))
                        
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
                                .foregroundColor(Color(#colorLiteral(red: 0.2492679467, green: 0.5971605092, blue: 1, alpha: 0.5)))
                        
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
                                .foregroundColor(Color(#colorLiteral(red: 0.2492679467, green: 0.5971605092, blue: 1, alpha: 0.5)))
                        
                    }
                }
               
            }
            
        }

    }
}
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(15)
                .background(Color(#colorLiteral(red: 0.08059277385, green: 0.1894979179, blue: 0.3140477538, alpha: 0.8984464269)))
                .cornerRadius(30)
                .shadow(color: .gray, radius: 5)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 0.2135200689, green: 0.5115208546, blue: 0.8565885498, alpha: 1)), lineWidth: 1))
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
        ContentView()
    }
}

