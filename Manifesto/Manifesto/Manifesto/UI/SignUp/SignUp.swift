//
//  SingUp.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/10/23.
//

import SwiftUI

struct SignUp: View {
    @ObservedObject var keyboardHeightHelper = KeyboardHeightHelper()
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var emergencyNumber = ""
    @State private var emergencyContactName = ""
    @StateObject private var viewModel = SignUp.ViewModel()
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                GeometryReader { ingeo in
                    Image("background")
                        .resizable()
                        .frame(width: geo.frame(in: .global).width, height: UIScreen.main.bounds.height)
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    
                    VStack() {
                        
                        Image("group2")
                            .resizable()
                            .frame(width: geo.frame(in: .global).height * 0.101, height: geo.frame(in: .global).height * 0.07)
                            .aspectRatio(contentMode: .fit)
                        
                        ScrollView {
                            VStack {
                                GeometryReader { zGeo in
                                    ZStack {
                                        Image("whiteBackground")
                                            .resizable()
                                            .frame(width: geo.frame(in: .global).width * 0.85, height: zGeo.frame(in: .local).height)
                                        
                                        
                                        VStack(spacing: ingeo.frame(in: .local).height / 18) {
                                            Group {
                                                TextField("Full Name", text: $name)
                                                TextField("Phone Number", text: $phoneNumber)
                                                TextField("Email", text: $email)
                                                TextField("Emergency Contact Number", text: $emergencyNumber)
                                                TextField("Emergency Contact Name", text: $emergencyContactName)
                                            }
                                            .frame(width: geo.frame(in: .local).width * 0.7, height: geo.frame(in: .local).width * 0.1)
                                            .padding(.all, 3)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(.black, lineWidth: 1)
                                            )
                                            
                                            Button {
                                                viewModel.signUser(name: name, phoneNumber: phoneNumber, email: email, emergencyNumber: emergencyNumber, emergencyContactName: emergencyContactName)
                                                dismiss()
                                            } label: {
                                                Image("saveAndSignButton")
                                                    .resizable()
                                                    .frame(width: 183, height: 50)
                                                    .scaledToFit()
                                            }
                                        } // VStack
                                        .frame(height: ingeo.frame(in: .local).height * 0.8)
                                        .position(x: zGeo.frame(in: .local).midX, y: zGeo.frame(in: .local).midY)
                                    } // ZStack
                                    .frame(height: ingeo.frame(in: .local).height * 0.8)
                                    .position(x: zGeo.frame(in: .local).midX, y: zGeo.frame(in: .local).midY)
                                    
                                } // Geometry
                                .frame(height: ingeo.frame(in: .local).height * 0.8)
                                
                            
                        } // Scroll
                        
                        Spacer()
                        
                        Image("hotels")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.frame(in: .local).width, height: geo.frame(in: .global).height * 0.12)
                            
                        } // VStack
                        .padding(.bottom, self.keyboardHeightHelper.keyboardHeight > 0 ? self.keyboardHeightHelper.keyboardHeight - 33 : 0)
                        //.offset(y: -self.keyboardHeightHelper.keyboardHeight)

                    } // VStack
                    .frame(maxHeight: ingeo.frame(in: .local).height)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                }
                .frame(maxHeight: geo.frame(in: .local).height)
            }
            
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct SingUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
