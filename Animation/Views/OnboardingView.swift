//
//  OnboardingView.swift
//  Animation
//
//  Created by Sergio on 17/1/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    let buttonStart = RiveViewModel(fileName: "button")
    @State var showModal = false
    @Binding var show: Bool
    
    var body: some View {
        ZStack{
            background
            
            content
                .offset(y: showModal ? -40 : 0)
            
            Color("Shadow")
                .opacity( showModal ? 0.5 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView(showModal: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()){
                                showModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 37, height: 37)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                            .shadow(color: Color("Shadow").opacity(0.4), radius: 6)
                        }
                            .offset(x:150, y:-290)
                             )
                    .zIndex(1)
            }
           
            Button {
                withAnimation {
                    show = false
                }
            } label: {
                Image(systemName: "xmark")
                            .frame (width: 32, height: 32)
                            .background(.black)
                            .foregroundColor(.white)
                            .mask(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(25)
            .offset(y: showModal ? -300 : 0)
        }
        
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text ("More Rutes & Better Life")
                .font(.custom("Poppins Bold", size: 50, relativeTo: .largeTitle))
                .frame(width: 320)
                .offset(x:0, y:50)
            
            Text ("TrackRoutes is a user-friendly app designed to organize and optimize your travel routes.")
                .customFont(.body)
                .frame(width: 300)
                .offset(x:0, y:50)
            
            Spacer()
            
            buttonStart.view()
                .frame(width: 240, height: 79)
                .overlay(
                    Label("Start route", systemImage: "flag.checkered")
                        .offset(x:0, y: 3)
                        .font(.headline)
                        
                )
                .offset(x:40, y:0)
                .background(
                    Color.black
                        .cornerRadius(35)
                        .blur(radius: 25)
                        .opacity(0.2)
                        .offset(y: 9)
                )
            // Event on tap
                .onTapGesture {
                    buttonStart.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                        withAnimation(.spring()){
                            showModal = true
                        }
                    }
            }
            
            Text ("Includes: 5 Free routes, 30+ premium routes ")
                .customFont(.footnote)
                .offset(x:20, y:20)
        }
        .padding(30)
        .padding(.top,30)
    }
    
    var background: some View {
        
            RiveViewModel(fileName: "shapes").view().ignoresSafeArea().blur(radius: 20)
                .hueRotation(Angle(degrees: 205))
                .background(
                    Image("Spline").blur(radius: 40).offset(x:100, y:100)
                        .hueRotation(Angle(degrees: 105))
                )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(show: .constant(true))
    }
}
