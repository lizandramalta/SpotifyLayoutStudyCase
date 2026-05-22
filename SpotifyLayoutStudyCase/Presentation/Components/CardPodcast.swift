//
//  card.swift
//  SpotifySwiftUI
//
//  Created by Nicole Dias on 21/05/26.
//

import SwiftUI

struct Podcast {
    var title: String
    var image: Image
}

struct PodcastCardView: View{
    
    var podcast: Podcast
    
    var body: some View {
        
        VStack(spacing: 6) {
            
                    podcast.image
                        .resizable()
                        .frame(width: 105, height: 105)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .cornerRadius(8)
            Text(podcast.title)
                .font(.system(size: 13))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 105, alignment: .top)
        }
    }
    
}

