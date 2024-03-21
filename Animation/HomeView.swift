//
//  HomeView.swift
//  Animation
//
//  Created by Sergio on 22/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView{
                content
            }
            
        }
    }
        var content: some View{
            VStack (alignment: .leading) {
                Text("Routes")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 39)
                    
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(routes) { route in
                            VCard(route: route)
                        }
                    }
                    .padding(25)
                    .padding(.bottom, 15)
                }
                
                Text ("Recent")
                    .customFont(.title3)
                    .padding(.horizontal,25)
                
                VStack (spacing: 15) {
                    
                    ForEach(routeSections) { section in
                        HCard(section: section)
                            
                    }
                }
                .padding(25)
       }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
