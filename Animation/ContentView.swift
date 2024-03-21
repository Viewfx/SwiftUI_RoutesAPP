//
//  ContentView.swift
//  Animation
//
//  Created by Sergio on 17/1/24.
//

import SwiftUI
import RiveRuntime


struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State var isOpen =  false
    @State var show = false
    
    let button = RiveViewModel(fileName: "menu_button", stateMachineName:  "State Machine", autoPlay: false)
    
    var body: some View {
      
        ZStack {
            Color("Background 2")
                .ignoresSafeArea()
            
            SideMenu()
            
            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 85)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70).ignoresSafeArea()
            }
            .mask(RoundedRectangle(cornerRadius: 30))
            .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
            .offset( x:isOpen ? 190 : 0)
            .ignoresSafeArea()
            
            //button user
            Image(systemName: "person")
                .frame(width: 40, height: 40)
                .background(.white)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.3),radius: 6, x:0, y:6)
                .frame(maxWidth:  .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .offset(x: isOpen ? 300 : 0)
                .padding(25)
                .offset(y:4)
                .onTapGesture {
                    withAnimation(.spring()){
                        show = true
                    }
                }
            
            button.view()
                .frame(width: 45, height: 45)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.3),radius: 6, x:0, y:6)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: . topLeading)
                .padding()
                .offset(x: isOpen ? 158 : 0, y: isOpen ? 00 : 0)
            //Animation button menu
                .onTapGesture {
                    try? button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.8)){
                        isOpen.toggle()
                    }
                }
            
            // to change the color of hour and wifi
                .onChange(of: isOpen) { newValue in
                    if newValue {
                        
                        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
                    } else {
                        UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    }
                }
            
            TapBar(tab: .chat)
                .offset(y: isOpen ? 168 : 0)
                
                
            
            if show {
                OnboardingView(show: $show)
                    .background(.white)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
            
        }
        
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

