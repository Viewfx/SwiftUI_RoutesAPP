//
//  CourseSection.swift
//  AnimatedApp
//
//  Created by Meng To on 2022-04-14.
//

import SwiftUI

struct RouteSection: Identifiable {
    var id = UUID()
    var title: String
    var caption: String
    var color: Color
    var image: Image
}

var routeSections = [
    RouteSection(title: "Section 1", caption: "Watch route - 5 mins", color: Color(hex: "9CC5FF"), image: Image("Topic 2")),
    RouteSection(title: "Section 2", caption: "Watch route - 15 mins", color: Color(hex: "6E6AE8"), image: Image("Topic 1")),
    RouteSection(title: "Section 3", caption: "Watch route - 20 mins", color: Color(hex: "005FE7"), image: Image("Topic 2")),
    RouteSection(title: "Section 4", caption: "Watch route - 30 mins", color: Color(hex: "BBA6FF"), image: Image("Topic 1"))
]
