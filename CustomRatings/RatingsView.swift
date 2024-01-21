//
//  RatingsView.swift
//  CustomRatings
//
//  Created by Scott Bennett on 1/15/24.
//

import SwiftUI

/// A view of inline images that represents a rating.
/// Tapping on an image will change if from an unfilled to a filled version of the image.
///
/// The following example shows a Ratings view with a maximum rating of 3 red hearts
/// bound to a heartRating property and a width of 50 specified.
///
///     RatingsView(
///                 maxRating: 3,
///                 currentRating: $heartRating,
///                 width: 50,
///                 symbol: "heart",
///                 color: .red)
///
///

struct RatingsView: View {
    
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    let symbol: String
    let color: Color
    
    /// Only two required parameters are maxRating and the binding to currentRating. All other parameters have default values
    /// - Parameters:
    ///    - maxRating:  The maximum rating on the scale
    ///    - currentRating:  A binding to the current rating variable
    ///    - width:  The width of the image used for the rating (Default - 20)
    ///    - symbol:  A String representing an SFImage that has a slash and fill variant (Default - "star")
    ///    - color: The color of the image (Default - .yellow)
 
    
         
    
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbol: String = "star",
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = symbol
        self.color = color
    }
    
    var body: some View {
        HStack {
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            ForEach(0..<maxRating, id: \.self) { rating in
                Image(systemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                    .symbolVariant(rating < currentRating ? .fill : .none)
                    .onTapGesture {
                        withAnimation {
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: CGFloat(maxRating * width))
    }
}

#Preview {
    struct PreviewWrapper: View {
        let maxRating = 5
        @State var currentRating = 2
        var body: some View {
            RatingsView(
                maxRating: maxRating,
                currentRating: $currentRating
            )
        }
    }
    return PreviewWrapper()
}
