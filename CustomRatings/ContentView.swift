//
//  ContentView.swift
//  CustomRatings
//
//  Created by Scott Bennett on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    var body: some View {
        RatingsView(
            maxRating: 5,
            currentRating: $currentRating,
            width: 40
        )
    }
}

#Preview {
    ContentView()
}
