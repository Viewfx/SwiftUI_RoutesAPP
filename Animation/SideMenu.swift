//
//  SideMenu.swift
//  Animated
//
//  Created by Meng To on 2022-05-19.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @State var selectedMenu: SelectedMenu = .home
    @State var isDarkMode = false
    
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.3))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("Sergio BP")
                        .customFont(.body)
                    Text("Frontend & UI")
                        .customFont(.subheadline)
                        .opacity(0.5)
                }
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    
               //to read MenuRow()
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            
            //History
            Text("HISTORY")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(20)
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    
               //to read MenuRow()
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            Spacer()
            
            HStack (spacing: 14) {
                menuDark[0].icon.view()
                    .frame(width: 30, height: 30)
                    .padding(20)
                Text(menuDark[0].text)
                    .customFont(.headline)
                    .offset(x:-15)
               
                Toggle("", isOn: $isDarkMode)
                    .padding(30)
                    .offset(x:-50)
            }
            
            
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .chat)
]

var menuItems2 = [
    MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
    MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .notifications)
]

var menuDark = [
    MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .darkmode)
]

enum SelectedMenu: String {
    case home
    case search
    case favorites
    case chat
    case history
    case notifications
    case darkmode
}
