//
//  Course.swift
//  AnimatedApp
//
//  Created by Meng To on 2022-04-14.
//

import SwiftUI

struct Route: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var routes = [
    Route(title: "New Free Route", subtitle: "Start your first route now", caption: "2 sections - 1 hour", color: Color(hex: "7850F0"), image: Image(systemName: "flag.and.flag.filled.crossed")),
    Route(title: "Second Route for beginners", subtitle: "This route is designed for a beginners. Walk around 2 hours", caption: "17 sections - 2 hours", color: Color(hex: "6792FF"), image: Image(systemName: "flag.and.flag.filled.crossed")),
    Route(title: "Advanced Route for a Premium Users", subtitle: "One of the best Routes. If you are passionate about routes, this is the best option. Walk for 4 hours to complete the objective.", caption: "15 sections - 4 hours", color: Color(hex: "005FE7"), image: Image(systemName: "flag.and.flag.filled.crossed"))
]
