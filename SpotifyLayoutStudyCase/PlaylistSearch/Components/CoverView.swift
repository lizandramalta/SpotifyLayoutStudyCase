//
//  File.swift
//  SpotifyLayoutStudyCase
//
//  Created by Késia Silva Viana on 19/05/26.
//

import SwiftUI

struct CoverView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("capaAlbum-indie")
                .resizable()
                .aspectRatio(1, contentMode: .fit)

            Text("Indie Pop")
                .font(.system(size: 32, weight: .bold))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(16)
        }
        .padding(.horizontal, 16)
    }
}
