//
//  LoginView.swift
//  InsightX
//
//  Created by Arish Tripathi on 02/05/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "Something went wrong."
    @State var isLoading = false
    @State var isSuccess = false
    @State var isComplete = false
    
    func login(){
        self.hideKeyboard()
        self.isFocused = false
        self.isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            self.isLoading = false

                if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
            } else {
                self.isSuccess = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            self.isSuccess = false
                            self.isComplete = true
                        }
                    
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .top) {
                
                
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                VStack {
                    
                    HStack{
                        
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1882352941, blue: 0.3882352941, alpha: 1)).opacity(0.1), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        TextField("Your Email".uppercased(), text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            .padding(.leading)
                            .frame(height: 44)
                        
                        .onTapGesture {
                            self.isFocused = true
                        }
                    }
                    
                    Divider().padding(.leading, 80)
                    
                    HStack{
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1882352941, blue: 0.3882352941, alpha: 1)).opacity(0.1), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        SecureField("Password".uppercased(), text: $password)
                        .keyboardType(.default)
                        .font(.subheadline)
                        .padding(.leading)
                        .frame(height: 44)
                        .onTapGesture {
                            self.isFocused = true
                        }
                        
                    }
                }
                .frame(height: 136)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1882352941, blue: 0.3882352941, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
                .padding(.horizontal, 16)
                .offset(y: 460)
                
                HStack {
                    Text("Forgot password?")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.login()
                        
                    }) {
                        Text("Log in".uppercased())
                            .foregroundColor(.white)
                    }
                    .padding(12)
                    .padding(.horizontal, 30)
                    .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message:
                                Text(self.alertMessage), dismissButton:
                                .default(Text("OK")))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
                
            }
            .offset(y: isFocused ? -300 : 0)
            .animation(isFocused ? .timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8) : .none)
                .animation(isFocused ? .easeInOut : nil)
            .onTapGesture {
                self.isFocused = false
                self.hideKeyboard()
            }
            
            if isLoading {
                LoadingView()
            }
            
            if isSuccess {
                SuccessView()
            }
            
            if !isSuccess && isComplete {
                TabBar().zIndex(1)
                Color.white.edgesIgnoringSafeArea(.all)
            }

        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        VStack {
            
            Image("cslogo")
            .resizable()
            .frame(width: 120, height: 30)
            .offset(y: 50)
            .offset(x: viewState.width/25, y: viewState.height/25)
            .scaleEffect(1.05)
            
            GeometryReader { geometry in
                Text("Login Screen")
                    .font(.system(size: geometry.size.width/10, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: 375, maxHeight: 100)
            .offset(y: -30)
            .padding(.top, 100)
            .padding(.horizontal, 16)
            .offset(x: viewState.width/15, y: viewState.height/15)
            
            Text("Please enter your username and password to login")
                .font(.subheadline)
                .foregroundColor(Color.white)
                .frame(width: 250)
                .multilineTextAlignment(.center)
                .offset(y: -50)
                .offset(x: viewState.width/20, y: viewState.height/20)
            
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 105)
                .offset(y: -10)
                .offset(x: viewState.width/25, y: viewState.height/25)
                .scaleEffect(1.05)
            
            Spacer()
        }
        .frame(height: 477)
        .frame(maxWidth: .infinity)
        .background(
            Image(uiImage: #imageLiteral(resourceName: "Blob"))
                .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                .blendMode(.plusDarker)
                .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                .onAppear { self.show = true }
        )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                    .blendMode(.overlay)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false)))
            //.background(Image(uiImage: #imageLiteral(resourceName: "Card3")), alignment: .bottom)
            .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .scaleEffect(isDragging ? 0.9 : 1)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .rotation3DEffect(Angle(degrees: 5), axis: (x: viewState.height, y: viewState.width, z: 0))
            //.edgesIgnoringSafeArea(.top)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.isDragging = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.isDragging = false
                }
        )
    }
}


