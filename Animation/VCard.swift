//
//  VCard.swift
//  Animation
//
//  Created by Sergio on 21/1/24.
//

import SwiftUI

struct VCard: View {
    var route: Route
    
    var body: some View {
        VStack(alignment:  .leading, spacing: 7) {
            Text(route.title)
                .customFont(.title2)
                .frame(maxWidth: 170, alignment: .leading)
            Text(route.subtitle)
                .customFont(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.8)
            Text(route.caption.uppercased())
                .customFont(.footnote2)
            
            Spacer()
            
            HStack {
                ForEach([4, 5, 6].shuffled(), id: \.self) { itemNumber in
                    Image("Avatar \(itemNumber)")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .mask(Circle())
                }
            }
        }
        .padding(25)
        .foregroundColor(.white)
        .frame(width: 250, height: 300)
        .background(.linearGradient(colors: [route.color, route.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 25))
        .shadow(color: route.color.opacity(0.4), radius: 9, y:11)
        .overlay(
            route.image
                .resizable()
                .frame(width: 35, height: 20)
                .padding(22)
                .offset(x:90, y:-105)
        )
    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard(route: routes[1])
    }
}
