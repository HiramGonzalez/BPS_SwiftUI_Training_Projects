//
//  MainScreen.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/10/23.
//

import SwiftUI

struct MainScreen: View {

    @StateObject private var viewModel = MainScreen.ViewModel()
    @State private var isWarningSignShowing = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image("homescreenWithBlackModeBackgroundMask")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    VStack {
                        ZStack {
                            Image("topBackground")
                                .resizable()
                                .frame(width: geo.frame(in: .local).width, height: geo.frame(in: .local).height * 0.33)
                                .scaledToFill()
                            Image("group2")
                                .resizable()
                                .frame(width: 87, height: 61)
                                .scaledToFit()
                        }
                        
                        if viewModel.usersArray.isEmpty {
                            Spacer()
                            Text("No one has currently signed in.\nBe the first to sign.")
                                .frame(width: 311, height: 45)
                                .font(.custom("Montserrat-Medium", size: 18))
                                .multilineTextAlignment(.center)
                                .scaledToFit()
                                .foregroundColor(.white)
                            Spacer()
                        } else {
                            Text("Sign in at the registry.")
                                .font(.custom("Montserrat-Medium", size: 18))
                                .multilineTextAlignment(.center)
                                .scaledToFit()
                                .foregroundColor(.white)
                            ScrollView {
                                ForEach(viewModel.usersArray) { element in
                                    VStack {
                                        HStack {
                                            Text(element.name)
                                                .font(.custom("Montserrat-Medium", size: 24))
                                                .multilineTextAlignment(.center)
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            Button {
                                                
                                            } label: {
                                                Image("editEdit")
                                            }
                                            .padding(.trailing)
                                            
                                            Button {
                                                isWarningSignShowing = true
                                            } label: {
                                                Image("menuCloseBig")
                                            }
                                        }
                                        .padding([.horizontal, .vertical], 9)
                                        
                                        Image("lineCopy8")
                                    }
                                    .alert("Continue to delete \(element.name)", isPresented: $isWarningSignShowing) {
                                        Button("Deny", role: .cancel) { }
                                        Button("Allow", role: .destructive) {
                                            viewModel.deleteUser(element)
                                        }
                                    }
                                }
                            }
                            .frame(width: geo.frame(in: .local).width * 0.9, height: geo.frame(in: .local).height * 0.4)
                            
                        }
                        Spacer()
                        
                        NavigationLink {
                            SignUp()
                        } label: {
                            Image("buttonMain")
                                .resizable()
                                .frame(width: 183, height: 50)
                                .scaledToFit()
                        }
                        Spacer()
                    }
                    .frame(maxWidth: geo.frame(in: .local).width, maxHeight: geo.size.height)
                } // VStack
                .frame(width: geo.frame(in: .global).width, height: geo.frame(in: .local).height)
                
            } // GeometryReader
            .onAppear {
                viewModel.loadUsers()
                print("Se esta presentando")
                print(viewModel.usersArray)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
