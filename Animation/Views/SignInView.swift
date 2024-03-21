//
//  SignInView.swift
//  Animation
//
//  Created by Sergio on 17/1/24.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var showModal: Bool
    
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
        
    func LogIn() {
        
        isLoading = true
        
        //show check in green
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                isLoading = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                withAnimation{
                    showModal = false
                }
                
            }
            
        //show red cross error access
        }else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
                
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                isLoading = false
                showModal = false
            }
        }
        
    }
    
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Acces to 5 Free routes, 30+ premium routes.")
                .customFont(.headline)
            
            //Email input
            VStack(alignment: .center) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField()
            }
            
            //Password input
            VStack(alignment: .center) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField()
            }
            
            Button {
               LogIn ()
                
            } label: {
                Label("Sign In", systemImage: "person")
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "00b4ff"))
                    .cornerRadius(9)
                    .foregroundColor(.white)
            }
                
            
            Text ("OR")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            Text("Sign with Email, Google or Apple")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
                
                    HStack {
                        Image("Logo Email")
                        Spacer()
                        Image("Logo Apple")
                        Spacer()
                        Image("Logo Google")
                    }
        }
        .padding(20)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.2), radius: 40, x:0, y:40)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 4, x:10, y:0)
        .overlay(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(.linearGradient(colors:
                                            [.white.opacity(0.9), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .padding(20)
        .overlay(
            ZStack {
                if isLoading {
                    check.view()
                        .frame(width: 80, height: 80)
                        .allowsTightening(false)
                }
                
                
            }
        )
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(showModal: .constant(true))
    }
}
