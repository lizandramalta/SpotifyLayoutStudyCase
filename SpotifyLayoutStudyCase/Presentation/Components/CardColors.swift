//
//  CardColors.swift
//  SpotifySwiftUI
//
//  Created by Nicole Dias on 21/05/26.
//
import SwiftUI

struct Card{
    var text: String
    var color: Color
}

struct CardColorView: View {
    
    var card: Card
    var body: some View {
     
        
        Rectangle()
            .fill(card.color)
            .frame(width: 105, height: 105)
            .overlay(
                Text(card.text)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) 
                    .padding(.horizontal, 4)
            )
            .cornerRadius(8)
        
        
    }
}

