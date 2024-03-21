//
//  MenuRow.swift
//  Animation
//
//  Created by Sergio on 23/1/24.
//

import SwiftUI

struct MenuRow: View {
    var item: MenuItem
    @Binding var selectedMenu: SelectedMenu
    
    var body: some View {
        
        HStack(spacing: 14) {
            item.icon.view()
                .frame(width: 40, height: 40)
                .opacity(0.6)
            Text(item.text)
                .customFont(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
    
        // color selected
        .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.blue)
                    .frame (maxWidth: selectedMenu == item.menu ? .infinity : 0)
        )
        //.background(Color) to make the entire button zone selectable
        .background(Color("Background 2"))
        .onTapGesture {
            try? item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                try? item.icon.setInput("active", value: false)
            }
            withAnimation {
                selectedMenu = item.menu
            }
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(item: menuItems[0], selectedMenu: .constant(.home))
    }
}
