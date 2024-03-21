//
//  HCard.swift
//  Animation
//
//  Created by Sergio on 22/1/24.
//

import SwiftUI

struct HCard: View {
    var section: RouteSection
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 7){
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
                .resizable()
                .frame(width: 60, height: 60)
        }
        .padding(30)
        .frame(maxWidth: 350, maxHeight: 105)
        .background(section.color)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}

struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        HCard(section: routeSections[1])
    }
}
