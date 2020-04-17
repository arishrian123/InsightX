//
//  ContentView.swift
//  InsightX
//
//  Created by Arish Tripathi on 14/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //email variable
    @State var email: String = ""
    //password variable
    @State var password: String = ""
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                
                .foregroundColor(Color.black).padding().font(.system(size: 25, weight: .medium, design: .rounded))
        }
    }
    
    struct TextFieldStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                
                .background(Color.black).accentColor(Color.gray).cornerRadius(5.0).padding()
        }
    }
    
    struct ButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 60)
                .accentColor(Color.black)
                .background(
                    ZStack {
                        Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
        }
    }
    
    
    var body: some View {
        
        ZStack{
        
        VStack {
            
            
            Spacer()
                //email stack
            HStack {
                Text("Email").modifier(LabelStyle())
                
                Spacer()
                TextField("Enter your email", text: $email).modifier(TextFieldStyle())
            }
            Spacer()
            //password stack
            
                HStack {
                    Text("Password").modifier(LabelStyle())
                    
                    TextField("Enter your password", text: $password).modifier(TextFieldStyle())
                }
            Spacer()
                VStack {
                    HStack{
                        NavigationLink(destination: MainView()){
                            Text("Login").modifier(ButtonStyle())
                        }
                        
                        NavigationLink(destination: Home()){
                            Text("Test").modifier(ButtonStyle())
                        }
                        
                    }
                    
                    
                    Spacer()
                    Image("InsightLogo").resizable().frame(width: 70, height: 85, alignment: .top)
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
        
    }

    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
            ContentView()
        
    }
}
}
