//
//  ContentView.swift
//  CustomRatings
//
//  Created by Scott Bennett on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    @State private var heartRating = 0
    @State private var pinRating = 0
    
    var body: some View {
        RatingsView(
            maxRating: 5,
            currentRating: $currentRating,
            width: 40
        )
        RatingsView(
            maxRating: 3,
            currentRating: $heartRating,
            width: 50,
            symbol: "heart",
            color: .red
        )
        RatingsView(
            maxRating: 5,
            currentRating: $pinRating,
            width: 40,
            symbol: "pin",
            color: .blue
        )
    }
}

#Preview {
    ContentView()
}
