//
//  TapBar.swift
//  Animation
//
//  Created by Sergio on 19/1/24.
//

import SwiftUI
import RiveRuntime

struct TapBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    struct HashableImage: Hashable {
        let name: String
        let tab: Tab
    }
    var tab: Tab
    let icons: [HashableImage] = [
        HashableImage(name: "ellipsis.message", tab: .chat),
        HashableImage(name: "magnifyingglass", tab: .search),
        HashableImage(name: "clock", tab: .timer),
        HashableImage(name: "bell", tab: .bell),
        HashableImage(name: "person.fill", tab: .user)
    ]
    var body: some View {
        ZStack{
            
            VStack{
                
                Spacer()
                HStack {
                    
                    content
                    
                }
                .padding(20)
                .background(.black)
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
        }
    }
    
    var content: some View {
        
        ForEach(icons, id: \.self) { icon in
            Button {
                withAnimation {
                    selectedTab = icon.tab
                }
            } label: {
                
                Image(systemName: icon.name)
                
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.horizontal, 6)
                    .aspectRatio(contentMode: .fit)
                    .frame( height: 36)
                    .opacity(selectedTab == icon.tab ? 1 : 0.5) // opacity to icon selected
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius:  3)
                                .frame(width: 18, height: 5)
                                .offset(y: -28)
                                .opacity((selectedTab == icon.tab ? 1 : 0.0))
                        })
            }
        }
    }
}
struct TapBar_Previews: PreviewProvider {
    static var previews: some View {
        TapBar(tab: .chat)
    }
}


enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}
