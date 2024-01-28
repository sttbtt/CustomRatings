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
    @State private var bookMarkRating = 0
    @State private var flagRating = 0
    
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
            symbolEnum: .heart,
            color: .red
        )
        RatingsView(
            maxRating: 5,
            currentRating: $pinRating,
            width: 40,
            symbol: "pin",
            color: .green
        )
        RatingsView(
            maxRating: 7,
            currentRating: $flagRating,
            width: 30,
            symbolEnum: .flag,
            color: .green
        )
    }
}

#Preview {
    ContentView()
}
